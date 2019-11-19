RSpec.describe 'GET /v1/users/{user_id}/favorite', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let!(:valid_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let!(:invalid_headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:cookbook) { create(:cookbook, user: user) }

  describe 'user can see list of their favorite recipes' do
    describe "successfully" do
      before do
        5.times { create(:favorite, cookbook: cookbook)}
        get '/v1/favorites', headers: valid_headers
      end
  
      it 'returns 200 response' do
        expect(response).to have_http_status 200
      end
  
      it 'returns 5 recipies' do
        expect(response_json['cookbook']['cookbook_recipes'].count).to eq 5
      end 
    end
    
    describe "unsuccessfully, user is not logged in" do
      before do
        get '/v1/favorites', headers: invalid_headers
      end

      it 'returns 401 response' do
        expect(response).to have_http_status 401
      end
  
      it 'returns error message' do
        expect(response_json['errors'].first).to eq "You need to sign in or sign up before continuing."
      end 
    end
  end
end