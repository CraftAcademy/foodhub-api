# frozen_string_literal: true

RSpec.describe 'Forking a recipe', type: :request do
  let(:creator) { create(:user) }
  let(:forker) { create(:user) }
  let(:forker_credentials) { forker.create_new_auth_token }
  let!(:valid_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(forker_credentials) }
  let(:original_recipe) do
    create(:recipe, 
      title: 'Watermelon slices', 
      ingredients: 'Watermelon',
      directions: 'Cut the watermelon')
  end

  let(:expected_attributes) do
    {
      title: 'Forked Watermelon slices',
      ingredients: 'Watermelon',
      directions: 'Cut the watermelon',
      user_id: forker.id,
      forked_from_recipe_id: Recipe.first.id
    }
  end

  describe 'user can fork a recipe' do
    before do
      post "/v1/recipes/#{original_recipe.id}/fork",
            params: {
              recipe: {
                title: 'Watermelon slices',
                ingredients: 'Watermelon',
                directions: 'Cut the watermelon'
              }
            },
            headers: valid_headers

    end
      
    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it 'returns sucess response' do
      expect(response_json['message']).to eq 'The recipe was successfully forked'
    end

    it 'has a new title leading with "Forked"' do
      expect(Recipe.last.title).to eq "Forked #{Recipe.first.title}"
    end
  end
end 