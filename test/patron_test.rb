require 'pry'
require_relative '../lib/patron'
require "Minitest/autorun"
require "Minitest/pride"

class PatronTest < MiniTest::Test
  def setup
  end

  def test_it_exists
    patron = Patron.new
    assert_instance_of Patron, patron
  end
end
