#1a/b - it changes the variable but does not mutate the caller (the array "numbers")
variable = 12
numbers = [1,2,3,4]

numbers.each do |i|
  variable += i
end

puts variable

#1c
numbers = [1,2,3,4]

numbers.select do |i| 
  i % 2 == 0
end

#2
numbers = [1,2,3,4]
numbers.each do |i|
  variable = 12
end

variable
#This does not work as the variable is local to the block
#after trying we get the following error message :  undefined local variable or method `variable'



