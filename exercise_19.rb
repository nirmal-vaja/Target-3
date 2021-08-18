def cheese_and_crackers(cheese_counts, boxes_of_crackers)
    puts "You have #{cheese_counts} cheeses!"
    puts "You have #{boxes_of_crackers} boxes of crackers"
    puts "Man that's enough for a party!"
    puts "Get a blanket.\n"
end

puts "We can just give the function numbers directly: "
cheese_and_crackers(20,30)

puts "Or, We can use variables from our scripts:"
amount_of_cheese = 10
amount_of_crackers = 40
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

puts "We can even do math inside too:"
cheese_and_crackers(10+2, 5+12)

puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100 , amount_of_crackers + 12)

puts "We can get the input from the users tooo and pass it to the function:"
print "Amount of cheese: "
amount_of_cheese_from_user = gets.chomp.to_i
print "Amount of crackers: "
amount_of_crackers_from_user = gets.chomp.to_i

cheese_and_crackers(amount_of_cheese_from_user, amount_of_crackers_from_user)