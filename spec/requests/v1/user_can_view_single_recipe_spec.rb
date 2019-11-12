RSpec.describe 'GET specific recipe' do
  describe 'user can view a specific recipe' do
    let(:recipe) { create(:recipe) }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }}

    before do  
      get "/v1/recipes/#{recipe.id}", headers: headers
    end

    it 'returns one article' do
      expect(response_json.count)
    end
    
    it 'returns status 200' do
      expect(response.status).to eq 200
    end
  end
end 