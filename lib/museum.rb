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
  end

  def add_exhibits(name, cost)
    @exhibits[name] = cost
  end

  def admit(patron)
    @revenue += 10
    patron.interests.each do |interest|
      @revenue += @exhibits[interest]
    end
  end

end
