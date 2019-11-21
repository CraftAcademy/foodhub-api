RSpec.describe 'Visitor can search for recipes', type: :request do
      
  before do
      get '/v1/recipes', headers: headers
    end

  it 'API returns 2 recipes' do
    expect(response_json['recipes'].count).to eq 2
  end
end