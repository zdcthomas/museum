require 'pry'
require_relative '../lib/museum'
require "Minitest/autorun"
require "Minitest/pride"

class MuseumTest < MiniTest::Test
  def test_museum_exists
    museum = Museum.new
    assert_instance_of Museum, museum
  end
end
