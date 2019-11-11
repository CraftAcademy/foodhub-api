RSpec.describe 'GET articles index' do 
  describe 'Listing articles' do 
    let!(:recipes) { 2.times { create(:recipe) } }
    before do
      get '/v1/recipes'
    end

    it 'API returns 2 recipes' do
      expect(response_json.count).to eq 2
    end

    it 'Recipe has a title' do
      expect(response_json.first['title']).to eq Article.first.title
    end

    it 'Article has ingredients' do
      expect(response_json.first['ingredients']).to eq Article.first.ingredients
    end

    it 'Article has instructions' do
      expect(response_json.first['instructions']).to eq Article.first.instructions
    end

    it 'Returns a status of 200' do
      expect(response.status).to eq 200
    end
  end

  describe 'Error if database contains no recipes' do 
    before do
      get '/v1/articles'
    end

    it 'returns error status' do
      expect(response.status).to eq 417
    end

    it 'returns error message' do
      expect(response_json["error_message"]).to eq "There are no recipes here"
    end
  end
end