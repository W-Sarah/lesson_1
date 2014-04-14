def not_mutate(array)
  array.each do |i|
    puts i
  end
end

def mutate(array)
  array.uniq!
end


a = [1,3,4,6,7,7,8,9]
not_mutate(a)
puts a

mutate(a)
puts a
