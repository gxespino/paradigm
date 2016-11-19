require 'test_helper'
require 'generators/paradigm/service_generator'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests Paradigm::Generators::ServiceGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  test 'service template files are created' do
    run_generator %w(send_user_email)

    assert_file 'app/services/send_user_email_service.rb', %r{SendUserEmailService}
    assert_file 'test/services/send_user_email_service_test.rb', %r{SendUserEmailServiceTest}
  end
end
