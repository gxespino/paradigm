module Paradigm
  module Generators
    class ServiceGenerator < ::Rails::Generators::NamedBase
      desc 'Creates a new service object with accompanying test file'

      source_root File.expand_path('../../templates/service', __FILE__)

      def create_service_file
        template 'service.rb',      "app/services/#{file_name.underscore}_service.rb"
        template 'service_test.rb', "test/services/#{file_name.underscore}_service_test.rb"
      end
    end
  end
end
