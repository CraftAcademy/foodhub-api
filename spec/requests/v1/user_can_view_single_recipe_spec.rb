RSpec.describe 'GET specific recipe' do
  describe 'user can view a specific recipe' do
    let(:recipe) { create(:recipe) }
    let(:headers) {{ HTTP_ACCEPT: "application/json" }

    before do  
      get "/api/v1/recipes/#{recipe.id}", headers: headers
    end
    
    it 'returns status 200' do
      expect(response.status).to eq 200
    end

    it 'returns the correct data' do
      expected_response = {
          "id"=>recipe.id,
          "title"=>recipe.title,
          "ingredients"=>recipe.ingredient,
          "directions"=>recipe.direction,
          "portions"=>recipe.portion,
        }
        expect(response_json['recipe']).to eq(expected_response)
    end
  end

    describe 'The recipe could not be found' do
      let(:headers) {{ HTTP_ACCEPT: "application/json" }
      before do
        get "/api/v1/recipes/#{recipe.id}", headers: headers
      end

      it 'returns the recipe could not be found' do
        expect(response.status).to eq 404
      end