# frozen_string_literal: true

RSpec.describe 'Update specific recipe' do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:user_credentials_1) { user_1.create_new_auth_token }
  let(:user_credentials_2) { user_2.create_new_auth_token }
  let!(:valid_headers_1) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials_1) }
  let!(:valid_headers_2) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials_2) }
  let(:image) do
    {
      type: 'application/jpg',
      encoder: 'name=new_iphone.jpg;base64',
      data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
      extension: 'jpg'
    }
  end
  before do
    post '/v1/recipes',
          params: {
            recipe: {
              title: 'Meatballs',
              ingredients: 'Minced meat, bacon, bread crumbs, cream, medium white chopped onion',
              directions: 'In large bowl, place 3 lb lean ground beef, chopped 1 medium white onion, 3 tablespoons dried oregano leaves and 1/4 cup bread crumbs. Place large ovenproof skillet over medium-high heat; pour reserved bacon drippings into skillet. Add meatballs; cook about 3 minutes on each side or just until seared. (You may have to do this in batches.)',
              image: image
            }
          },
          headers: valid_headers_1
  end
  describe 'user can fork a recipe' do
    # let(:expected_attributes) do
    #   {
    #     title: 'Forked Cookies',
    #     ingredients: 'Cookie ingredients, chocolate chips.',
    #     directions: 'Make the cookies.',
    #     user_id: user_2.id,
    #     forked_from_recipe_id: recipe.id
    #   }
    # end
    it 'fork recipe' do
      id = Recipe.last.id
      post "/v1/recipes/#{id}/fork", headers: valid_headers_2
    end
  end


  #   it 'returns 201 response' do
  #     binding.pry
  #     expect(response).to have_http_status 201
  #   end

  #   %i[title ingredients directions].each do |attribute|
  #     it "updates #{attribute} as value on the last Recipe" do
  #       expect(Recipe.last.send(attribute)).to eq expected_attributes[attribute]
  #     end
  #   end
  # end
end