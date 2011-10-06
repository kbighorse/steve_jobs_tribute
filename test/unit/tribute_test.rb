require 'test_helper'

class TributeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tribute.new.valid?
  end
end
