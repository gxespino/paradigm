require 'test_helper'
require 'generators/paradigm/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Paradigm::Generators::InstallGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  test 'service module is created' do
    run_generator

    assert_file 'app/services/service.rb', %r{module Service}
  end
end
