people = 30 
cars = 40
trucks = 15

if cars > people 
    puts "We should take cars."
elsif cars < people 
    puts "We shoudl not take cars."
else
    puts "We can't decide."
end

if trucks > cars 
    puts "That's too many trucks."
elsif trucks < cars 
    puts "Maybe we could take the trucks."
else
    puts "We still can't decide."
end

if people > trucks
    puts "Alright, let's take the trucks."
else
    puts "Fine, let's stay home."
end
