require 'test/unit'
require File.dirname(__FILE__) + '/../lib/parent_resources'

class ParentResourcesTest < Test::Unit::TestCase
  include ParentResources

  def test_this_plugin
    flunk
  end
end
