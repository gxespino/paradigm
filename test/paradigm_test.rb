require 'test_helper'

class ParadigmTest < ActiveSupport::TestCase
  test 'Paradigm has a version number' do
    refute_nil ::Paradigm::VERSION
  end
end
