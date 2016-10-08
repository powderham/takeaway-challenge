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

    it "Menu can be printed" do
      {takeaway.dishes.length + 2}.times do expect(STDOUT).to receive(:puts) end
      takeaway.view_menu
    end

  end
end
