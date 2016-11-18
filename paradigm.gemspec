$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'paradigm/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'paradigm'
  spec.version     = Paradigm::Rails::VERSION
  spec.homepage    = 'https://github.com/gxespino/paradigm'
  spec.authors     = ['Glenn Espinosa']
  spec.email       = ['glennpeter.espinosa@gmail.com']
  spec.summary     = 'Template generators for service abstractions'
  spec.description = 'Provides template generators for service abstractions'
  spec.license     = 'MIT'

  spec.files = Dir["{lib,vendor}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.test_files = Dir['test/**/*']

  spec.add_dependency 'railties'

  spec.add_development_dependency 'rails'
end
