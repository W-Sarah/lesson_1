require 'pry'

def cards_total(array)
  values = {"2" => 2, "3" => 3, "4" => 4,"5" => 5,"6" => 6,"7" => 7,"8" => 8,"9" => 9,"10" => 10, "Jack" => 10,"Queen" => 10, "King" => 10, "Ace" =>  [1, 11] }
  hand = []
  total = 0
  total_1 = 0
  total_11 = 0

  array.each do |suit,card|
    hand << card
  end

  if hand.include?("Ace")
    hand.delete("Ace")
    total_1 = hand.inject(0) {|sum, card| sum + values[card]} + 1
    total_11 = hand.inject(0) {|sum, card| sum + values[card]} + 11
    if (total_11 == 21) 
      total = total_11
    else 
      total = total_1
    end
  else total = hand.inject(0) {|sum, card| sum + values[card]}
  end
  return total
end

def menu
puts "**** Welcome to Sarah's Casino - Blackjack Game ****"
puts "Enter (p) to play Blackjack or (e) to exit the game"
gets.chomp
end

#variables
suits = [ "D", "H", "C", "S"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
deck = suits.product(cards)

#menu
input = menu
while input != "e"

  if input == "p"
puts "Please enter your name"
name = gets.chomp
puts
puts "Welcome #{name}, let's play Blackjack!"

#initialize game
deck.shuffle!
player_cards = []
dealer_cards = []
player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_total = cards_total(player_cards)
dealer_total = cards_total(dealer_cards)

puts "#{name}, you have the following cards: #{player_cards.join("/")} for a total of #{player_total}"
puts "The dealer has the following cards: #{dealer_cards.join("/")} for a total of #{dealer_total}"

#player play
puts
puts "#{name}, you play first."
puts "#{name}, would you like to (h)it or (s)tay?"
answer = gets.chomp
while ["h","s"].include?(answer) == false
  puts "Please enter 'h' or 's'"
  answer = gets.chomp
end

until answer == 's'
  player_cards << deck.pop
  player_total = cards_total(player_cards)
  puts "#{name}, you have the following cards: #{player_cards.join("/")} for a total of #{player_total}"
  break if player_total > 20
  puts
  puts "#{name}, would you like to (h)it or (s)tay?"
  answer = gets.chomp
end

if player_total == 21
  puts "Blackjack! Congratulations, you win this game!"
elsif player_total > 21
  puts "Sorry #{name}, you have lost this game."
else
  puts "The dealer is going to play now"

#dealer play
until dealer_total > 17
  dealer_cards << deck.pop
  dealer_total = cards_total(dealer_cards)
  puts "The dealer has the following cards: #{dealer_cards.join("/")} for a total of #{dealer_total}"
end

#Comparison between the player and the dealer hand
  if dealer_total > player_total && dealer_total < 22
    puts "Sorry #{name}, you have lost this game."
  else
    puts "Congratulations #{name}, you win this game!"
  end
end

  else 
    puts "Invalid - Please enter (p) or (e)"
  end

  puts "press any key to go back to the menu"
  gets
  input = menu
end

