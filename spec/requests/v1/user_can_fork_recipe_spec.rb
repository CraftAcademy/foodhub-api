# frozen_string_literal: true

RSpec.describe 'Update specific recipe' do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:user_credentials) { user.create_new_auth_token }
  let!(:valid_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

  let(:recipe) do
    create(:recipe,
           title: 'Cookies',
           ingredients: 'Cookie ingredients, chocolate chips.',
           directions: 'Make the cookies.'
           user_id: user_1.id)
  end
  describe 'user can fork a recipe' do
    let(:expected_attributes) do
      {
        title: 'Forked Cookies',
        ingredients: 'Cookie ingredients, chocolate chips.',
        directions: 'Make the cookies.',
        user_id: user_2.id,
        forked_from_recipe_id: recipe.id
      }
    end
    before do
      post "/v1/recipes/#{recipe.id}/fork", headers: valid_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    %i[title ingredients directions].each do |attribute|
      it "updates #{attribute} as value on the last Recipe" do
        expect(Recipe.last.send(attribute)).to eq expected_attributes[attribute]
      end
    end
  end