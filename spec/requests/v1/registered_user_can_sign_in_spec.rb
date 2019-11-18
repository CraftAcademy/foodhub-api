# frozen_string_literal: true

RSpec.describe 'Registered user can sign in', type: :request do
  let!(:user) { create(:user, email: 'user@craft.se', password: 'password') }

  it 'should return User on successfully sign in' do
    post '/v1/auth/sign_in', params: {
      email: 'user@craft.se',
      password: 'password'
    }
    expected_response = { data:
      { id: user.id,
        email: 'user@craft.se',
        provider: 'email',
        uid: 'user@craft.se',
        allow_password_change: false,
        name: user.name,
        nickname: nil,
        image: nil } }
    expect(response_json).to eq JSON.parse(expected_response.to_json)
  end

  it 'should return error if invalid email' do
    post '/v1/auth/sign_in', params: {
      email: 'not_registered_user@craft.se',
      password: 'password'
    }
    expect(response_json['errors']).to include 'Invalid login credentials. Please try again.'
  end

  it 'should return error if invalid password' do
    post '/v1/auth/sign_in', params: {
      email: 'user@craft.se',
      password: 'wrong-password'
    }
    expect(response_json['errors']).to include 'Invalid login credentials. Please try again.'
  end
end
