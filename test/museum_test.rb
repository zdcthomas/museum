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
  end
  def test_museum_can_add_exhibits
    museum = Museum.new("DMA")
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

  def test_museum_can_have_revenue
    dma = Museum.new("DMA")
    assert_equal 0, dma.revenue
  end

  def test_museum_can_admit_patrons
    dma = Museum.new("DMA")
    bob = Patron.new("Bob")
    jen = Patron.new("Jennifer")

    bob.add_interests("Impressionism")
    bob.add_interests("Rocks")

    jen.add_interests("Impressionism")
    jen.add_interests("Monet")
    jen.add_interests("Grecian Pottery")

    dma.add_exhibits("Manet",10)
    dma.add_exhibits("Impressionism", 15)
    dma.add_exhibits("Rocks", 2)
    dma.add_exhibits("Grecian Pottery", 10)

    assert_equal 0, dma.revenue

    dma.admit(bob)

    assert_equal 27, dma.revenue

    dma.admit(jen)

    assert_equal 62, dma.revenue
  end

  def test_patrons_of_exhibit
    dma = Museum.new("DMA")
    bob = Patron.new("Bob")
    jen = Patron.new("Jennifer")

    dma.add_exhibits("Manet",10)
    dma.add_exhibits("Portraits", 15)
    dma.add_exhibits("Art", 2)
    dma.add_exhibits("Grecian Pottery", 10)

    bob.add_interests("Art")
    bob.add_interests("Portraits")

    jen.add_interests("Portraits")
    jen.add_interests("Manet")
    jen.add_interests("Cubism")

    dma.admit(bob)
    assert_equal [bob], dma.patrons_of("Art")
    assert_equal [], dma.patrons_of("Manet")
    assert_equal [], dma.patrons_of("Grecian Pottery")
    assert_equal [bob], dma.patrons_of("Portraits")

    dma.admit(jen)
    # binding.pry
    assert_equal [bob,jen], dma.patrons_of("Portraits")
    assert_equal [jen], dma.patrons_of("Manet")
    assert_equal [], dma.patrons_of("Grecian Pottery")
    assert_equal [bob], dma.patrons_of("Art")

  end

end
