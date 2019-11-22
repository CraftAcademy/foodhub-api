RSpec.describe 'GET recipes index', type: :request do
  describe 'Listing user recipes' do
    let!(:recipe_1) { create(:recipe) }
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
    let(:invalid_headers) { { HTTP_ACCEPT: 'application/json' } }
    let!(:recipe_2) { create(:recipe, user_id: user.id) }

    describe "successfully" do
      before do
        get '/v1/recipes', params: { user_recipe: true }, headers: headers
      end

      it 'returns a status of 200' do
        expect(response).to have_http_status 200
      end

      it "returns one recipe" do
        expect(response_json['recipes'].count).to eq 1
      end
      
      it 'returns a recipe with users id' do
        expect(response_json['recipes'].last['user_id']).to eq user.id
      end
    end

    describe "unsuccessfully" do
      before do
        get '/v1/recipes', params: { user_recipe: true }, headers: invalid_headers
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