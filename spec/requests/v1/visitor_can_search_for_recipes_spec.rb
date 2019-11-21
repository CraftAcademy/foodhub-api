RSpec.describe 'User can search for recipes', type: :request do
      
    before do
        get '/v1/recipes', headers: headers
      end
end
  
