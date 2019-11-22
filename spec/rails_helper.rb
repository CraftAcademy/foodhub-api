# frozen_string_literal: true

require 'coveralls'
Coveralls.wear_merged!('rails')

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'pundit/matchers'
require 'elasticsearch/extensions/test/cluster'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

module ResponseJSON
  def response_json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include ResponseJSON, type: :request
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include Shoulda::Matchers::ActiveModel, type: :model

  config.before(:each, type: :search_request) do
    Chewy.strategy(:bypass)
    unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
      Elasticsearch::Extensions::Test::Cluster.start(
        port: 9250,
        nodes: 1,
        timeout: 120
      )
    end
    RecipesIndex.create! unless RecipesIndex.exists?
  end

  config.after(:each, type: :search_request) do
    RecipesIndex.delete
  end
end
