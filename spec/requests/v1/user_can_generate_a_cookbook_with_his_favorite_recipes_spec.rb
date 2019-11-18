# frozen_string_literal: true

RSpec.describe 'POST /v1/users/{user_id}/favorite', type: :request do
  let!(:user) { create(:user) }
  let(:user_credentials) { user.create_new_auth_token }
  let!(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  let(:recipe_1) do
    create(:recipe,
           title: 'Watermelon slices')
  end
  let(:recipe_2) do
    create(:recipe,
           title: 'Apple Pie')
  end

  let(:add_favorites) do
    cookbook = create(:cookbook, user: user)
    true if cookbook.favorites.create(recipe: recipe_1) &&
            cookbook.favorites.create(recipe: recipe_2)
  end

  describe 'adds recipe that is created by another user to collection' do
    before do
      post '/v1/cookbooks/', headers: user_headers
    end

    it 'returns 201 response' do
      expect(response).to have_http_status 201
    end

    it 'returns sucess response' do
      expect(response_json['message']).to eq 'The cookbook was generated and will be available for download soon'
    end
  end
end
