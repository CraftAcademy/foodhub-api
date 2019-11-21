# frozen_string_literal: true

RSpec.describe 'POST /v1/recipe/:id/rating', type: :request do
  let!(:recipe) { create(:recipe) }
  let!(:impressed_user) { create(:user) }
  let(:impressed_user_credentials) { impressed_user.create_new_auth_token }
  let!(:impressed_user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(impressed_user_credentials)
  end

  let(:recipe_2) { create(:recipe, user: impressed_user) }

  describe 'likes a recipe' do
    before do
      post "/v1/recipes/#{recipe.id}/rating",
      params: {
        score: 4
      },
      headers: impressed_user_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it "rating persited" do
      rating = Rating.last
      expect(rating.recipe_id).to eq recipe.id
    end
  end


  describe 'cannot like own recipe' do
    before do
      post "/v1/recipes/#{recipe_2.id}/rating", headers: impressed_user_headers
    end

    xit 'returns 405 response' do
      expect(response).to have_http_status 409
    end

    xit 'returns sucess response' do
      expect(response_json['error_message']).to eq 'You cannot like your own recipe'
    end
  end
end