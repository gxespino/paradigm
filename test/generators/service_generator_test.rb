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

  test 'service template files can be nested' do
    run_generator %w(account::send_user_email)

    assert_file 'app/services/account/send_user_email_service.rb', %r{Account::SendUserEmailService}
    assert_file 'test/services/account/send_user_email_service_test.rb', %r{Account::SendUserEmailServiceTest}
  end

  # test 'double semicolons will raise an error' do
  #   stderr = capture(:stderr) do
  #     run_generator %w(payment::refund_user_payment)
  #   end

  #   assert_match %r{Invalid argument syntax}, stderr

  #   assert_no_file 'app/services/payment/refund_user_payment_service.rb'
  #   assert_no_file 'test/services/payment/refund_user_payment_service_test.rb'
  # end
end
