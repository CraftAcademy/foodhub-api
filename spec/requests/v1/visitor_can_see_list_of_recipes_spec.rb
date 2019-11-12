RSpec.describe 'GET recipes index' do 
  describe 'Listing recipes' do 
    let!(:recipes) { 2.times { create(:recipe) } }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }}
    before do
      get '/v1/recipes',
      headers: headers
    end

    it 'API returns 2 recipes' do
      expect(response_json["recipes"].count).to eq 2
    end

    it 'Recipe has a title' do
      expect(response_json["recipes"].first['title']).to eq Recipe.first.title
    end

    it 'Recipe has ingredients' do
      expect(response_json["recipes"].first['ingredients']).to eq Recipe.first.ingredients
    end

    it 'Recipe has instructions' do
      expect(response_json["recipes"].first['directions']).to eq Recipe.first.directions
    end

    it 'Returns a status of 200' do
      expect(response.status).to eq 200
    end
  end

  describe 'Message if database contains no recipes' do 
    before do
      get '/v1/recipes',
      headers: headers
    end

    it 'returns response status of 200' do
      expect(response.status).to eq 200
    end

    it 'returns message about no recipes' do
      expect(response_json["message"]).to eq "There are no recipes here"
    end
  end
end