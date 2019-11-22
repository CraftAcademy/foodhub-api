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
      directions: 'Cut the watermelon',
      description: 'A classic dish')
  end

  let(:image) do
    {
      type: 'application/jpg',
      encoder: 'name=new_iphone.jpg;base64',
      data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
      extension: 'jpg'
    }
  end

  describe 'user can fork a recipe' do
    before do
      post "/v1/recipes/#{original_recipe.id}/fork",
            params: {
              recipe: {
                title: 'Vegan Watermelon slices',
                ingredients: 'Vegan friendly Watermelon',
                directions: 'Cut the watermelon in a veganistic way',
                description: 'A classic vegan dish',
                image: image
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

    it 'has a new title' do
      expect(Recipe.last.title).to eq "Vegan Watermelon slices"
    end
  end
end   