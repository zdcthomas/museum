require 'pry'
require_relative '../lib/patron'
require "Minitest/autorun"
require "Minitest/pride"

class PatronTest < MiniTest::Test
  def setup
  end

  def test_it_existsg
    patron = Patron.new("Katarina")
    assert_instance_of Patron, patron
  end

  def test_patron_can_have_name
    patron = Patron.new("Jim")
    assert_equal "Jim", patron.name
    patron = Patron.new("Harold")
    assert_equal "Harold", patron.name
    patron = Patron.new("Samantha")
    assert_equal "Samantha", patron.name
  end
end
