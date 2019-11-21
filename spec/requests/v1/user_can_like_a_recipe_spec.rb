# frozen_string_literal: true

RSpec.describe 'POST /v1/users/{user_id}/like', type: :request do
  let!(:recipe) { create(:recipe) }
  let!(:impressed_user) { create(:user) }
  let(:impressed_user_credentials) { impressed_user.create_new_auth_token }
  let!(:impressed_user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(impressed_user_credentials)
  end

  let(:recipe_2) { create(:recipe, user: impressed_user) }

  describe 'likes a recipe' do
    before do
      post "/v1/recipes/#{recipe.id}/like", headers: impressed_user_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it 'returns success response' do
      expect(response_json['message']).to eq 'You liked this recipe!'
    end

  end

  describe 'cannot like the same recipe twice' do
    before do
      post "/v1/recipes/#{recipe.id}/like", headers: impressed_user_headers
    end

    it 'returns 405 response' do
      expect(response).to have_http_status 409
    end

    it 'returns sucess response' do
      expect(response_json['error_message']).to eq 'You have already liked this recipe'
    end
  end

  describe 'cannot like own recipe' do
    before do
      post "/v1/recipes/#{recipe_2.id}/like", headers: impressed_user_headers
    end

    it 'returns 405 response' do
      expect(response).to have_http_status 409
    end

    it 'returns sucess response' do
      expect(response_json['error_message']).to eq 'You cannot like your own recipe'
    end
  end
end