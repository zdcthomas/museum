require 'pry'
require_relative 'patron'
class Museum
  attr_reader :name,
              :exhibits,
              :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
    @patrons_in_exhibit = {}
  end

  def add_exhibits(name, cost)
    @exhibits[name] = cost
    @patrons_in_exhibit[name] = []
  end

  def admit(patron)
    @revenue += 10
    patron.interests.each do |interest|
      unless @exhibits[interest].nil?
        @patrons_in_exhibit[interest] << patron
        @revenue += @exhibits[interest]
      end
    end
  end

  def patrons_of(exhibit)
    @patrons_in_exhibit[exhibit]
  end

end
