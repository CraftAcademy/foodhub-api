# frozen_string_literal: true

RSpec.describe 'GET recipes index' do
  describe 'Listing recipes' do
    let!(:recipes) { 2.times { create(:recipe) } }
    let(:user) { create(:user) }
    let(:headers) {{ HTTP_ACCEPT: 'application/json' }}
    before do
      recipe = Recipe.first
      10.times { create(:rating, user_id: user.id, recipe_id: recipe.id)}
      get '/v1/recipes', headers: headers
    end

    it 'Returns a status of 200' do
      expect(response).to have_http_status 200
    end
    
    it 'API returns 2 recipes' do
      expect(response_json['recipes'].count).to eq 2
    end

    it 'Recipe has a title' do
      expect(response_json['recipes'].first['title']).to eq Recipe.first.title
    end

    it 'Recipe has ingredients' do
      expect(response_json['recipes'].first['ingredients']).to eq Recipe.first.ingredients
    end

    it 'Recipe has instructions' do
      expect(response_json['recipes'].first['directions']).to eq Recipe.first.directions
    end

    it "Recipe has a rating" do
      expect(response_json['recipes'].first).to include 'rating'
    end
  end

  describe 'Message if database contains no recipes' do
    before do
      get '/v1/recipes', headers: headers
    end

    it 'returns response status of 200' do
      expect(response).to have_http_status 200
    end

    it 'returns message about no recipes' do
      expect(response_json['recipes']).to eq []
    end
  end
end
