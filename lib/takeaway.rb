require 'twilio-ruby'
class Takeaway

  attr_reader :dishes, :current_order, :print_current_order,:client


  def initialize
    @dishes = [
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
    account_sid = 'AC2dcc305129bcd9a5749f74ac4a0e99c9'
    auth_token = 'b0d1d4b38109dedb04f2cd829fd3e043'
    @current_order = Order.new
    @client = Twilio::REST::Client.new account_sid, auth_token
  end


  def view_menu
    count = 0
    puts "Today's menu"
    @dishes.each do |pizza|
      count += 1
      puts("#{count}. #{pizza[:name]} - #{pizza[:price]}")
    end
    puts
  end

  def order_dish(dish, quantity)
    @current_order.current_order << [dishes[dish-1],quantity]
  end

  def confirm_order(total)
    wrong_total?(total) ? text_order("#{print_current_order} arriving by #{Time.new.hour+1}:#{Time.new.min}") : not_verified_message
  end

  def print_current_order
    @current_order.print_current_order
  end

  private
  def not_verified_message
    "Order total not verified"
  end

  def calculate_total
    current_order.total
  end

  def wrong_total?(total)
    total == calculate_total
  end

  def text_order(body)
    client.messages.create(from: '441582380423', to: '447713476196', body:body )
  end

  # def interactive_menu
  #   loop do
  #     print_menu
  #     methods(gets.chomp)
  #   end
  # end
  #
  # def print_menu
  #   puts "1. Show menu"
  #   puts "2. Choose food"
  #   puts "3. Show order"
  #   puts "9. Exit"
  # end

  # def methods(selection)
  #   case (selection)
  #     when "1"
  #       view_menu
  #     when "2"
  #       select_order
  #     when "3"
  #       puts "Current order:"
  #       print_current_order
  #       puts
  #     when "9"
  #       puts "Thank you, goodbye"
  #       exit
  #     else
  #       puts "Please make a valid selection"
  #     end
  # end

  # def select_order
  #   puts "Please choose your order"
  #   puts "Select 0 to view menu"
  #   puts "Select pizza by number"
  #   puts "Type anything else to return to menu"
  #   order(gets.chomp)
  # end

  # def order(selection)
  #   puts "Your selection: #{@dishes[selection.to_i-1][:name]}"
  #   puts "Select another pizza by its number (0 to view menu)"
  #   puts "Type anything else to return to menu"
  #
  #   case selection
  #     when "0"
  #       view_menu
  #     when "1"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "2"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "3"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "4"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "5"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "6"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "7"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "8"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     when "9"
  #       food = @dishes[selection.to_i-1]
  #       @current_order << food
  #       order(gets.chomp)
  #     else
  #       puts "Returning to menu"
  #       order(gets.chomp)
  #     end
  # end


end
