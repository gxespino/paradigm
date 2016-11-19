module Paradigm
  module Generators
    class ServiceGenerator < ::Rails::Generators::Base
      InvalidFilePathError = Class.new(Thor::Error)
      desc 'Creates a new service object with accompanying test file'

      source_root File.expand_path('../../templates/service', __FILE__)
      argument :service_name, required: true,
        desc: 'The service to be created, can also be scoped'

      def create_service
        @service_name = service_name

        if erroneous_arguments?
          raise InvalidFilePathError, <<-ERROR.strip_heredoc
          ----------------------------------------------------------------------

          Invalid argument syntax. Paradigm generators must follow a certain
          style.

          For top level services use:

            rails generate paradigm:service [service]

          For nested services use:

            rails generate paradigm:service [scope]::[service]

          ----------------------------------------------------------------------
          ERROR
        end

        if scoped_service?
          split = service_name.partition('::').delete_if { |x| x == '::' }
          @scope = split[0]
          @service_name = split[1]

          template 'nested_service.rb', "app/services/#{scope}/#{service_name.underscore}_service.rb"
          template 'nested_service_test.rb', "test/services/#{scope}/#{service_name.underscore}_service_test.rb"
        else
          template 'service.rb', "app/services/#{service_name.underscore}_service.rb"
          template 'service_test.rb', "test/services/#{service_name.underscore}_service_test.rb"
        end
      end

      private

      attr_reader :service_name, :scope, :service

      def erroneous_arguments?
        false
      end

      def scoped_service?
        service_name.include?('::')
      end
    end
  end
end
