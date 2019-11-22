# NOTE! CI service (Semaphore) need to have env var CHEWY set to 'true'
# This setup should work on localhost
Chewy.strategy(:bypass)
RecipesIndex.create! unless RecipesIndex.exists?
RSpec.configure do |config|
  config.before(:each, type: :search_request) do
    unless ENV['CHEWY']
      
      unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
        Elasticsearch::Extensions::Test::Cluster.start(
          port: 9250,
          nodes: 1,
          timeout: 120
        )
      end
      
    end
  end

  config.after(:each, type: :search_request) do
    RecipesIndex.delete
  end
end
