# frozen_string_literal: true

RSpec.describe 'Visitor can create an account', type: :request do

  it 'returns success message' do
    post '/v1/auth/', params: {
      email: 'user@craft.se',
      password: 'password'
    }
    expect(response_json['status']).to eq 'success'
  end
end
