module Paradigm
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Creates Service module in app/services'

      def self.source_root
        @source_root ||= File.expand_path('../../templates/install', __FILE__)
      end

      def copy_service
        template 'service.rb', 'app/services/service.rb'
      end
    end
  end
end
