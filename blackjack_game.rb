deck = {2 => 2, 3 => 3, 4 => 4,5 => 5,6 => 6,7 => 7,8 => 8,9 => 9,10 => 10, "Valet" => 10, "Queen" => 10, "King" => 10 }


def hit_player(array, number_of_times, name)
deck = {2 => 2, 3 => 3, 4 => 4,5 => 5,6 => 6,7 => 7,8 => 8,9 => 9,10 => 10, "Valet" => 10,"Queen" => 10, "King" => 10 }
  1.upto(number_of_times) do
    array.push(deck.keys[rand(12)])
  end
  puts "#{name}, you have the following cards: #{array.join(" ,")}"
end

def hit_dealer(array, number_of_times)
deck = {2 => 2, 3 => 3, 4 => 4,5 => 5,6 => 6,7 => 7,8 => 8,9 => 9,10 => 10, "Valet" => 10, "Queen" => 10, "King" => 10 }
  1.upto(number_of_times) do
    array.push(deck.keys[rand(12)])
  end
  puts "The dealer has the following cards: #{array.join(" ,")}"
end

def hand_sum(array)
  deck = {2 => 2, 3 => 3, 4 => 4,5 => 5,6 => 6,7 => 7,8 => 8,9 => 9,10 => 10, "Valet" => 10, "Queen" => 10, "King" => 10 }
  array.reduce {|sum, key| sum.to_i + deck[key].to_i}
end


#menu
def menu
puts "**** Welcome to Sarah's Casino - Blackjack Game ****"
puts "Enter (p) to play Blackjack or (e) to exit the game"
gets.chomp
end



#running the app

input = menu

while input != "e"
  if input == "p"

puts "Please enter your name"
name = gets.chomp
puts
puts "Welcome #{name}, let's play Blackjack!"

#initialize game
puts ""
player = []
dealer = []
player_hand_sum = 0
dealer_hand_sum = 0
hit_player(player,2, name)
player_hand_sum = hand_sum(player)
hit_dealer(dealer, 2)
dealer_hand_sum = hand_sum(dealer)

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
  hit_player(player, 1, name)
  player_hand_sum = hand_sum(player)
  break if player_hand_sum > 20
  puts
  puts "#{name}, would you like to (h)it or (s)tay?"
  answer = gets.chomp
end
if player_hand_sum == 21
  puts "Blackjack! Congratulations, you win this game!"
elsif player_hand_sum > 21
  puts "Sorry #{name}, you have lost this game."
else
  puts "The dealer is going to play now"
end

 #dealer play
 until dealer_hand_sum > 17
  hit_dealer(dealer, 1)
  dealer_hand_sum = hand_sum(dealer)
end














  else 
    puts "Please enter (p) or (e)"
  end

  puts "press any key to go back to the menu"
  gets
  input = menu
end
