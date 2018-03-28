require 'pry'
class Museum
  attr_reader :name,
              :exhibits
  def initialize(name)
    @name = name
    @exhibits = {}
  end

  def add_exhibits(name, cost)
    @exhibits[name] = cost
  end
end
