RSpec.describe 'GET /v1/users/{user_id}/favorite', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let(:cookbook) { create(:cookbook, user: user)}

  describe 'user can see list of their favorite recipes' do
    before do
      5.times { create(:favorite, cookbook: cookbook)}
      get '/v1/favorites', headers: headers
    end

    it 'returns 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns 5 recipies' do
      expect(response_json['cookbook']['cookbook_recipes'].count).to eq 5
    end
  end
end