class Order
  attr_accessor :current_order, :total
  attr_reader :total

  def initialize
    @current_order = []
  end

  def select_order(item, quantity)
    @current_order << [item,quantity]
    "Current total: #{total}"
  end

  def total
    total = 0
    @current_order.each do |pizza|
      total += pizza[0][:price]*pizza[1]
    end
    total
  end

  def print_current_order
    current_order.map{|x| "#{x[0][:name]}. Quantity: #{x[1]}"}
  end

end
