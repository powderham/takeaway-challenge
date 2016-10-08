require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  context "Dishes" do
    it "Restaurant should have at least one dish" do
      expect(takeaway.dishes.length).to be > 1
    end

    it "Dishes should have a name" do
      expect(takeaway.dishes.last[:name]).not_to be nil
    end

    it "Dishes should have a price" do
      expect(takeaway.dishes.last[:price]).not_to be nil
    end
  end

  context "#view_menu" do
    printing_fluff = 2
    it "Menu can be printed" do
      (takeaway.dishes.length + printing_fluff).times do expect(STDOUT).to receive(:puts) end
      takeaway.view_menu
    end
  end

  context "#select_order" do
      it "Selected dishes move to current_order" do
        number = rand(takeaway.dishes.length)
        takeaway.select_order(number)
        expect(takeaway.current_order.last).to eq takeaway.dishes[number-1]
      end
  end

  context "#verify_order" do
    before(:each) do
      @total = 0
      rand(5).times do
        number = rand(takeaway.dishes.length)
        takeaway.select_order(number)
        @total += takeaway.dishes[number-1][:price]
      end
    end

    it "Verify order should return a total price" do
      expect(takeaway.calculate_total).to eq @total
    end

    it "Current order printer should contain ordered pizzas" do
      expect(takeaway.print_current_order).to eq takeaway.current_order.map{|x| "#{x[:name]} #{x[:price]}"}
    end
  end
end
