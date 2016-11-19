module Paradigm
  module Generators
    class ServiceGenerator < ::Rails::Generators::NamedBase
      desc 'Creates a new service object with accompanying test file'

      source_root File.expand_path('../../templates/service', __FILE__)

      def create_service_file
        @file_name = file_name

        if nested_file_name?
          @path = file_name.partition(':').delete_if { |x| x == ':' }

          template 'nested_service.rb', "app/services/#{path[0]}/#{path[1].underscore}_service.rb"
          template 'nested_service_test.rb', "test/services/#{path[0]}/#{path[1].underscore}_service_test.rb"
        else
          template 'service.rb', "app/services/#{file_name.underscore}_service.rb"
          template 'service_test.rb', "test/services/#{file_name.underscore}_service_test.rb"
        end
      end

      private

      attr_reader :file_name, :path

      def nested_file_name?
        file_name.include?(':')
      end
    end
  end
end
