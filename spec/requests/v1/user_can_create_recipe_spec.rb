# frozen_string_literal: true

RSpec.describe 'V1::Recipes', type: :request do
  let(:user) { create(:user) }
  let(:user_credentials) { user.create_new_auth_token }
  let!(:valid_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

  let(:image) do
    {
      type: 'application/jpg',
      encoder: 'name=new_iphone.jpg;base64',
      data: 'iVBORw0KGgoAAAANSUhEUgAABjAAAAOmCAYAAABFYNwHAAAgAElEQVR4XuzdB3gU1cLG8Te9EEgISQi9I71KFbBXbFixN6zfvSiIjSuKInoVFOyIDcWuiKiIol4Q6SBVOtI7IYSWBkm',
      extension: 'jpg'
    }
  end
  describe 'POST /v1/recipes' do
    describe 'with valid params' do
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
             headers: valid_headers
      end

      it 'returns 201 status' do
        expect(response).to have_http_status 201
      end

      it 'returns success message' do
        expect(response_json['message']).to eq 'The recipe was successfully created.'
      end
    end

    describe 'with invalid params' do
      before do
        post '/v1/recipes',
             params: {
               recipe: {
                 title: '',
                 ingredients: '',
                 directions: '',
                 image: image
               }
             },
             headers: valid_headers
      end

      it 'returns 422 status' do
        expect(response).to have_http_status 422
      end

      it 'returns success message' do
        expect(response_json['error_message']).to eq 'Unable to create recipe'
      end
    end
  end
end
