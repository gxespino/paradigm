module Paradigm
  module Generators
    class ServiceGenerator < Rails::Generators::Base
      SINGLE_COLON = ':'.freeze
      DOUBLE_COLON = '::'.freeze

      desc <<-DESC.strip_heredoc
        ------------------------------------------------------------------
                         PARADIGM SERVICE GENERATOR
        ------------------------------------------------------------------

        Creates a new service object with accompanying test file in your
        app/services folder.

        Scoped service objects will be added to your app/services/[scope]
        folder.

        For top level services use:

        #=> rails g paradigm:service [service]

        For nested services use:

        #=> rails g paradigm:service [scope]::[service]
        ------------------------------------------------------------------
      DESC

      argument :service_name, required: true,
        desc: 'The service to be created, can also be scoped'

      def self.source_root
        @source_root ||= File.expand_path('../../templates/service', __FILE__)
      end

      def create_service
        @service_name = service_name

        if scoped_service_containing?(DOUBLE_COLON)
          use_scoped_templates(DOUBLE_COLON)
        elsif scoped_service_containing?(SINGLE_COLON)
          use_scoped_templates(SINGLE_COLON)
        else
          template 'service.rb',      "app/services/#{service_name.underscore}_service.rb"
          template 'service_test.rb', "test/services/#{service_name.underscore}_service_test.rb"
        end
      end

      private

      attr_reader :service_name, :scope, :service

      def scoped_service_containing?(colon_style)
        service_name.include?(colon_style)
      end

      def use_scoped_templates(colon_style)
        split = split_by_colon(colon_style)
        @scope, @service_name = split[0], split[1]

        template 'nested_service.rb',      "app/services/#{scope}/#{service_name.underscore}_service.rb"
        template 'nested_service_test.rb', "test/services/#{scope}/#{service_name.underscore}_service_test.rb"
      end

      def split_by_colon(colon_style)
        service_name
          .partition(colon_style)
          .delete_if { |str| str == colon_style }
      end
    end
  end
end
