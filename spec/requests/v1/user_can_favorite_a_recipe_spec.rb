# frozen_string_literal: true

RSpec.describe 'POST /v1/users/{user_id}/favorite', type: :request do
  let!(:creator) { create(:user) }
  let(:creator_credentials) { creator.create_new_auth_token }
  let!(:impressed_user) { create(:user) }
  let(:impressed_user_credentials) { impressed_user.create_new_auth_token }
  let!(:impressed_user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(impressed_user_credentials)
  end

  let(:recipe_1) do
    create(:recipe,
           title: 'Watermelon slices',
           user: creator)
  end
  let(:recipe_2) do
    create(:recipe,
           title: 'Apple Pie',
           user: impressed_user)
  end

  describe 'adds recipe that is created by another user to collection' do
    before do
      post "/v1/recipes/#{recipe_1.id}/favorite", headers: impressed_user_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it 'returns sucess response' do
      expect(response_json['message']).to eq 'The recipe was successfully arred to your favorites'
    end

  end

  describe 'adds recipe that is created by user to collection' do
    before do
      post "/v1/recipes/#{recipe_2.id}/favorite", headers: impressed_user_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it 'returns sucess response' do
      expect(response_json['message']).to eq 'The recipe was successfully arred to your favorites'
    end
  end
end
