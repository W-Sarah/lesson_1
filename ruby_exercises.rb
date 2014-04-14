#1
numbers = [1,2,3,4,5,6,7,8,9,10]

numbers.each do |i|
  puts i
end

#2
numbers.each do |i|
  puts i if i > 5
end

#3
numbers.select { |i| i % 2 != 0 }

#4
numbers << 11
numbers.unshift(0)

#5
numbers.pop
numbers << 3

#6
numbers.uniq

#7
# Main differences between Array and hashes
#  - array are ordered while hashes are not
#  - Hashes are indexed by keys while arrays are indexed by numbers


#8
my_hash_1_8 = { "key_1" => "value_1", "key_2" => "value_2"}
my_hash_1_9 = { key_1: "value_1", key_2: "value_2"}

#9
h = {a:1, b:2, c:3, d:4}
h[:b]

#10
h[:e] = 5

#13
h.select { |key, value| value >= 3.5}

#14
#Can hash values be arrays? 
h = { fruits: ["apple", "pear", "banana"], vegetables: ['cucumber', 'lettuce'], meat: ['chicken', 'beef']}
#Can you have an array of hashes? 
a = [{ key_1: "value_1", key_2: "value_2"}, { key_3: "value_3", key_4: "value_4"}]

#15
# I like ruby-doc.org when looking for a certain method to use or trying to understand this method.
# When I'm looking for an answer to a question, I use stack overflow most of the time. 

