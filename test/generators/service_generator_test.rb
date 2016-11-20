require 'test_helper'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests Paradigm::Generators::ServiceGenerator

  destination File.join(Rails.root, 'tmp')

  setup do
    prepare_destination
  end

  test 'service template files are created' do
    run_generator %w(send_confirmation)

    assert_file 'app/services/send_confirmation_service.rb', %r{SendConfirmationService}
    assert_file 'test/services/send_confirmation_service_test.rb', %r{SendConfirmationServiceTest}
  end

  test 'service template files can be nested' do
    run_generator %w(account::send_user_email)

    assert_file 'app/services/account/send_user_email_service.rb', %r{Account::SendUserEmailService}
    assert_file 'test/services/account/send_user_email_service_test.rb', %r{Account::SendUserEmailServiceTest}
  end

  test 'single semicolons will also nest services' do
    run_generator %w(payment:refund_user_payment)

    assert_file 'app/services/payment/refund_user_payment_service.rb', %r{Payment::RefundUserPaymentService}
    assert_file 'test/services/payment/refund_user_payment_service_test.rb', %r{Payment::RefundUserPaymentServiceTest}
  end
end
