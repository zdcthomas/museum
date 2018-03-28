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

  def test_patron_can_have_interests
    patron = Patron.new("Brian")
    assert_equal [], patron.interests
  end

  def test_patron_can_add_interests
    patron = Patron.new("Horace")
    patron.add_interests("Dulac Prints")
    assert_equal ["Dulac Prints"], patron.interests
    patron.add_interests("Turner")
    assert_equal ["Dulac Prints", "Turner"], patron.interests
    interest = (0...8).map { (65 + rand(26)).chr }.join
    patron.add_interests(interest)
    assert_equal ["Dulac Prints", "Turner", interest], patron.interests
  end
end
