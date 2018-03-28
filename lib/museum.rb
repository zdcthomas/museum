require 'pry'
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
end
