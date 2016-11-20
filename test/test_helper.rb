# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/rails_app/config/environment.rb",  __FILE__)
require 'rails/test_help'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActiveSupport::TestCase.fixtures :all
end

# For generators
require "rails/generators/test_case"
require "generators/paradigm/install_generator"
require "generators/paradigm/service_generator"
