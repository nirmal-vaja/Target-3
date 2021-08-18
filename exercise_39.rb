# create a mapping of states to abbreviation
states = {
    'Oregon' => 'OR',
    'Florida' => 'FL',
    'California' => 'CA',
    'New York' => 'NY',
    'Michigan' => 'MI'
}

#create a basic set of states and some cities in them
cities = {
    'CA' => 'San Francisco',
    'MI' => 'Detroit',
    'FL' => 'Jacksonville'
}

# add some more cities 

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

#puts out some cities
puts '-' * 70
puts "NY State has: #{cities['NY']}"
puts "OR State has: #{cities['OR']}"

#put some states
puts '-' * 70
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

#do it by using the state then citites dict
puts '-' * 70
puts "Michigan has: #{cities[states['Michigan']]}"
puts "Florida has: #{cities[states['Florida']]}"

#puts every state abbreviation
puts '-' * 70 
states.each do |state, abbrev|
    puts "#{state} is abbreviated #{abbrev}"
end

# puts every city in state
puts '-' * 70
cities.each do |abbrev , city|
    puts "#{abbrev} has the city #{city}"
end

# now do both at the same time 
puts '-' * 70
states.each do |state, abbrev|
    city = cities[abbrev]
    puts "#{state} is abbreviated as #{abbrev} and has city #{city}"
end

puts '-' * 70
# by default, ruby says nil when something isn't there
state = states['Texas']

if !state
    puts "Sorry, no Texas."
end


# default  value using ||= with the nil result
city = cities['TX']
city ||= "Does not exitst"
puts "The city for the state 'TX' : #{city}"

