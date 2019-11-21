RSpec.describe 'Visitor can search for recipes', type: :request do
  let!(:egg_recipe_1) { create(:recipe, title: 'Breakfast Egg Muffins') }
  let!(:egg_recipe_2) { create(:recipe, ingredients: 'Eggs') }
  let!(:non_egg_recipe) { create(:recipe, title: 'Sallad') }

  describe "successfully" do
    before do
      get '/v1/search', 
      params: {
        search: 'Eggs'
      }
      headers: headers
    end

    it "returns 200 response" do
      expect(response).to have_http_status 200
    end
    
    it 'API returns 2 recipes' do
      expect(response_json['recipes'].count).to eq 2
    end
  end
end