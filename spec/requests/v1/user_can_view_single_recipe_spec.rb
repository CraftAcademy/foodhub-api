RSpec.describe 'GET specific recipe' do
  describe 'user can view a specific recipe' do
    let(:recipe) { create(:recipe) }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }

    before do
      get "/v1/recipes/#{recipe.id}"
      headers: headers
    end

    it 'Recipe has a title' do      
      expect(response_json['title']).to eq Recipe.first.title
    end

    it 'Recipe has content' do
      expect(response_json['content']).to eq Recipe.first.content
    end

    it 'Recipe has directions' do
      expect(response_json['directions']).to eq Recipe.first.content
    end

    it 'Returns a successful response status' do
      expect(response.status).to eq 200
    end
  end

  describe 'Specific recipe not found' do
    let(:recipe) { create(:recipe) }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }

    before do
      get "/v1/articles/12345"
      headers: headers
    end

    it 'Returns an error status of 404' do
      expect(response.status).to eq 404
    end

    it 'Returns an error message' do
      expect(response_json["error_message"]).to eq "This recipe is currently unavailable."
    end
  end
end