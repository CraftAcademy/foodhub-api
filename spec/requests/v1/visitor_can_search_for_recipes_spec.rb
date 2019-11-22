# frozen_string_literal: true

RSpec.describe 'Visitor can search for recipes',
               type: %i[request search_request] do
  let!(:egg_recipe_1) { create(:recipe, title: 'Breakfast Egg Muffins') }
  let!(:egg_recipe_2) { create(:recipe, ingredients: 'Eggs') }
  let!(:egg_recipe_3) { create(:recipe, directions: 'Place the Eggs in the bowl') }
  let!(:non_egg_recipe) { create(:recipe, title: 'Sallad') }

  describe 'successfully' do
    before do
      post '/v1/search',
           params: {
             q: 'Egg'
           }
    end

    it 'returns 200 response' do
      expect(response).to have_http_status 200
    end

    it 'API returns 3 recipes' do
      expect(response_json['recipes'].count).to eq 3
    end
  end

  describe 'bad query' do
    before do
      post '/v1/search',
           params: {
             q: 'Toast'
           }
    end

    it 'returns 404 response' do
      expect(response).to have_http_status 404
    end
  
    it 'API returns error message' do
      expect(response_json['message']).to eq 'Your search yielded no results'
    end
  end

  
end
