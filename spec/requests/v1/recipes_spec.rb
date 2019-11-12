# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'V1::Recipes', type: :request do
  describe 'POST /v1/recipes' do
    describe 'with valid params' do
      before do
        post '/v1/recipes',
             params: {
               recipe:
               { title: 'Meatballs',
                 ingredients: 'Minced meat, bacon, bread crumbs, cream, medium white chopped onion',
                 directions: 'In large bowl, place 3 lb lean ground beef, chopped 1 medium white onion, 3 tablespoons dried oregano leaves and 1/4 cup bread crumbs. Place large ovenproof skillet over medium-high heat; pour reserved bacon drippings into skillet. Add meatballs; cook about 3 minutes on each side or just until seared. (You may have to do this in batches.)' }
             }
      end

      it 'returns 201 status' do
        expect(response).to have_http_status 201
      end

      it 'returns success message' do
        expect(response_json['message']).to eq 'The recipe was successfully created.'
      end
    end

    describe 'with invalid params' do
      before do
        post '/v1/recipes',
             params: {
               recipe:
               { title: '',
                 ingredients: '',
                 directions: '' }
             }
      end

      it 'returns 422 status' do
        expect(response).to have_http_status 422
      end

      it 'returns success message' do
        expect(response_json['error_message']).to eq 'Unable to create recipe'
      end
    end
  end

  path '/v1/recipes' do
    post 'Creates a recipe' do
      tags 'Recipe'
      consumes 'application/json'
      parameter name: :recipe, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          ingredients: { type: :string },
          directions: { type: :string }
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
  end
end
