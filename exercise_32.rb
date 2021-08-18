the_count = [1,2,3,4,5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes' , 3 , 'quarters']

#this first kind of for-loop goes through a list in a more traditional style found in other languages

for number in the_count
    puts "This is count #{number}"
end

#changing the for number in the_count to be more typical .each style loop like the others

# the_count.each do |i|
#     puts "This is count #{i}"
# end


#same as above, but in a more Ruby style this and the next one are the preffered way Ruby for-loop are written

fruits.each do |fruit|
    puts "A fruit of type: #{fruit}"
end


#also we can go through mixed lists too  note this is yet another style, exactly like above but a different syntax (way to write it.)

change.each {|i| puts "I got #{i}"}

# we can build lists, first start with an empty list 

elements = []

# then use the range operator to do 0 to 5 counts 
(0..5).each do |i|
    # puts "Adding #{i} to the list."
    elements.push(i)
    # elements << i
end

#now we can print them out too

elements.each {|i| puts "Elements was : #{i}"}