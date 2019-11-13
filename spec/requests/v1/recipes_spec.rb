# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'V1::Recipes', type: :request do
  path '/v1/recipes' do
    post 'Creates a recipe' do
      tags 'Recipes'
      description 'Creates an instance of Recipe.'
      consumes 'application/json'
      parameter name: :recipe, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Swedish Meatballs' },
          ingredients: { type: :string, example: 'Minced meat, bacon, bread crumbs, cream, medium white chopped onion' },
          directions: { type: :string, example: 'In large bowl, place 3 lb lean ground beef...' },
          image: { type: :string, 'x-nullable': true, example: 'Base64 encoded image' }
        },
        required: %w[title ingredients directions]
      }

      response '201', 'recipe created' do
        let(:recipe) do
          { title: 'Meatballs',
            ingredients: 'Minced meat, bacon, bread crumbs, cream, medium white chopped onion',
            directions: 'In large bowl, place 3 lb lean ground beef, chopped 1 medium white onion, 3 tablespoons dried oregano leaves and 1/4 cup bread crumbs. Place large ovenproof skillet over medium-high heat; pour reserved bacon drippings into skillet. Add meatballs; cook about 3 minutes on each side or just until seared. (You may have to do this in batches.)' }
        end
        run_test! do
          expect(response_json['message']).to eq 'The recipe was successfully created.'
        end
      end

      response '422', 'invalid request' do
        let(:recipe) do
          { title: '',
            ingredients: '',
            directions: '' }
        end
        run_test! do
          expect(response_json['error_message']).to eq 'Unable to create recipe'
        end
      end
    end
    get 'Returns collection of recipes' do
      tags 'Recipes'
      description 'Returns collection of recipes in the system.'
      consumes 'application/json'
      produces 'application/json'
      response '200', 'Collection of recipes returned' do
        schema properties: {
          recipes: {
            type: :array,
            items: {
              properties: {
                id: { type: :integer },
                title: { type: :string },
                ingredients: { type: :string },
                directions: { type: :string }
              }
            }
          }
        }
        before { create_list(:recipe, 5) }
        run_test! do
          expect(response_json['recipes'].count).to eq 5
        end
      end
    end
  end
  path '/v1/recipes/{id}' do
    get 'Returns a recipe' do
      tags 'Recipes'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, required: true
      response '200', 'Recipe found' do
        schema properties: {
          recipe: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              ingredients: { type: :string },
              directions: { type: :string }
            }
          }
        }
        let(:id) { create(:recipe).id }
        run_test!
      end
    end
  end
end
