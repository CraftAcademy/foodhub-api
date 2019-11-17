# frozen_string_literal: true

RSpec.describe 'GET specific recipe' do
  describe 'user can view a specific recipe' do
    let(:user) { create(:user) }
    let(:user_credentials) { user.create_new_auth_token }
    let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
    let(:image) do
      {
        type: 'application/jpg',
        encoder: 'name=new_iphone.jpg;base64',
        data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
        extension: 'jpg'
      }
    end
    
    before do
      post '/v1/recipes',
            params: {
              recipe: {
                title: 'Cookies',
                ingredients: 'Cookie ingredients, chocolate chips.',
                directions: 'Google it!',
                image: image
              }
            },
            headers: headers
      
      get "/v1/recipes/#{Recipe.last.id}", headers: headers
    end

    it 'Returns a successful response status' do
      expect(response).to have_http_status 200
    end

    it 'Recipe has a title' do
      expect(response_json['recipe']['title']).to eq 'Cookies'
    end

    it 'Recipe has content' do
      expect(response_json['recipe']['ingredients']).to eq 'Cookie ingredients, chocolate chips.'
    end

    it 'Recipe has directions' do
      expect(response_json['recipe']['directions']).to eq 'Google it!'
    end
  end

  describe 'Specific recipe not found' do
    let(:recipe) { create(:recipe) }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }

    before do
      get '/v1/recipes/12345', headers: headers
    end

    it 'Returns an error status of 404' do
      expect(response).to have_http_status 404
    end

    it 'Returns an error message' do
      expect(response_json['error_message']).to eq 'The recipe could not be found.'
    end
  end
end
