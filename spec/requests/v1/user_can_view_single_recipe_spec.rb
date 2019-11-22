# frozen_string_literal: true

RSpec.describe 'GET specific recipe', type: :request do
  describe 'user can view a specific original recipe' do
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:user_3) { create(:user) }

    let(:user_credentials) { user_1.create_new_auth_token }
    let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
    let(:recipe) do
      create(:recipe,
            title: 'Cookies',
            ingredients: 'Cookie ingredients, chocolate chips.',
            directions: 'Make the cookies.')
    end
    
    before do
      create(:rating, score: 1, user_id: user_1.id, recipe_id: recipe.id)
      create(:rating, score: 3, user_id: user_2.id, recipe_id: recipe.id)
      create(:rating, score: 5, user_id: user_3.id, recipe_id: recipe.id)
      get "/v1/recipes/#{recipe.id}", headers: headers
    end

    it 'Returns a successful response status' do
      expect(response).to have_http_status 200
    end

    it 'Recipe has a title' do
      expect(response_json['recipe']['title']).to eq 'Cookies'
    end

    it 'Recipe has content' do
      expect(response_json['recipe']['ingredients']).to eq 'Cookie ingredients, chocolate chips.'
    end

    it 'Recipe has directions' do
      expect(response_json['recipe']['directions']).to eq 'Make the cookies.'
    end

    it "Recipe does not have parent " do
      expect(response_json['recipe']['parent']).to eq nil
    end

    it "Recipe has a rating" do
      expect(response_json['recipe']['rating']).to eq 3
    end
    
    it 'Recipe has a user_rating' do
      expect(response_json['recipe']['user_rating']).to eq 1
    end
  end


  describe "user can view a forked recipe" do
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }

    let(:user_credentials) { user.create_new_auth_token }
    let!(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
    let(:original_recipe) { create(:recipe, user: user, title: 'Lasagna') }
    let(:forked_recipe) {
      create(
        :recipe,
        parent_id: original_recipe.id,
        user: another_user,
        title: 'Vegan Lasagna'
      )
    }

    before do
      get "/v1/recipes/#{forked_recipe.id}", headers: headers
    end

    it 'Returns a successful response status' do
      expect(response).to have_http_status 200
    end

    it 'Recipe has a title' do
      expect(response_json['recipe']['title']).to eq forked_recipe.title
    end

    it 'Recipe does not have a user_rating' do
      expect(response_json['recipe']['user_rating']).to eq nil
    end

    it "Recipe has a parent title sent with it" do
      expect(response_json['recipe']['parent']['title']).to eq original_recipe.title
    end

    it "Recipe has a parent id sent with it" do
      expect(response_json['recipe']['parent']['id']).to eq original_recipe.id
    end

    it "Recipe has a parent title sent with it" do
      expect(response_json['recipe']['parent']['user_name']).to eq original_recipe.user.name
    end
  end
  

  describe 'Specific recipe not found' do
    let(:recipe) { create(:recipe) }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }

    before do
      get '/v1/recipes/12345', headers: headers
    end

    it 'Returns an error status of 404' do
      expect(response).to have_http_status 404
    end

    it 'Returns an error message' do
      expect(response_json['error_message']).to eq 'The recipe could not be found.'
    end
  end
end
