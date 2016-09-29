require 'rails_helper'
require 'rspec-rails'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.include ApiHelper, type: :api
  config.include Requests::JsonHelpers, type: :api
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
end