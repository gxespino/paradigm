require 'test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Paradigm::Generators::InstallGenerator

  destination File.join(Rails.root, 'tmp')

  setup do
    prepare_destination
  end

  test 'service module is created' do
    run_generator

    assert_file 'app/services/service.rb', %r{module Service}
  end
end
