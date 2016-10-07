
$dishes = [
  {name: "Cheese & Tomato", price:  14.99},
  {name: "Mighty Meaty", price:  14.99},
  {name: "Pepperoni Passion", price:  16.99},
  {name: "Texas BBQ", price:  17.99},
  {name: "Vegi Supreme", price:  15.99},
  {name: "American Hot", price:  18.99},
  {name: "Chicken Feast", price:  17.99},
  {name: "Hawaiian", price:  18.99},
  {name: "Meateor", price:  18.99},
]

current_order = []


def interactive_menu
  loop do
    print_menu
    methods(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Show menu"
  puts "2. Choose food"
  puts "3. Show order"
  puts "9. Exit"
end

def methods(selection)
  case (selection)
    when 1
      view_menu
    when 2
      puts select_order
    when 3
      puts current_order
    when 9
      puts "Thank you, goodbye"
      exit
    else
      puts "Please make a valid selection"
    end
end

def view_menu
  count = 0
  puts "Today's menu"
  $dishes.each do |pizza|
    count += 1
    puts("#{count}. #{pizza[:name]} - #{pizza[:price]}")
  end
end

def select_order
  puts "Please choose your order"
  puts "Select 0 to view menu"
  puts "Select pizza by number"
  puts "Type 'Done' to finish"

  case
end

def order(selection)
  current_order << dishes[selection-1]
end

interactive_menu
