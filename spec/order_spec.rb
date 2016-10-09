require 'order'
describe Order do
  subject(:order) {described_class.new}
  pizza = {name: "Pepperoni Passion", price:  16.99}
  context "Instantiation" do
    it "#select_order" do
      order.select_order(pizza, 2)
      expect(order.current_order).to include [pizza, 2]
    end

    it "#total" do
      order.select_order(pizza, 2)
      expect(order.total).to eq pizza[:price]*2
    end

    it "Current order printer should contain ordered pizzas" do
      order.select_order(pizza, 2)
      expect(order.print_current_order).to eq order.current_order.map{|x| "#{x[0][:name]}. Quantity: #{x[1]}"}
    end
  end
end
