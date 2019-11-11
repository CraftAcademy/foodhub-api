RSpec.describe 'GET articles index' do 
  describe 'Listing articles' do 
    let!(:recipes) { 2.times { create(:recipe) } }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }
    before do
      get '/v1/recipes'
      headers: headers
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

  describe 'Message if database contains no recipes' do 
    before do
      get '/v1/articles'
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