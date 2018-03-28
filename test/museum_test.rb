require 'pry'
require_relative '../lib/museum'
require "Minitest/autorun"
require "Minitest/pride"

class MuseumTest < MiniTest::Test
  def test_museum_exists
    museum = Museum.new("DMA")
    assert_instance_of Museum, museum
  end

  def test_museum_has_name
    museum = Museum.new("DMA")
    assert_equal "DMA", museum.name
    museum = Museum.new("San Fransisco Museum of Art")
    assert_equal "San Fransisco Museum of Art", museum.name
    museum = Museum.new("Denver Art Museum")
    assert_equal "Denver Art Museum", museum.name
    museum = Museum.new("La Louvre")
    assert_equal "La Louvre", museum.name
    name = (0...8).map { (65 + rand(26)).chr }.join
    museum = Museum.new(name)
    assert_equal name, museum.name
  end

  def test_museum_can_have_exhibits
    museum = Museum.new("DMA")
    assert_instance_of Hash, museum.exhibits
    museum.add_exhibits("modrian",5)
    assert_equal ["modrian"], museum.exhibits.keys
    assert_equal [5], museum.exhibits.values
    museum.add_exhibits("Manet",2)
    assert_equal ["modrian","Manet"], museum.exhibits.keys
    assert_equal [5,2], museum.exhibits.values
    museum.add_exhibits("Sezane",8)
    museum.add_exhibits("",0)
    assert_equal ["modrian","Manet", "Sezane", ""], museum.exhibits.keys
    assert_equal [5,2,8,0], museum.exhibits.values
  end
end
