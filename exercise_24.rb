puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with that do \n newlines and \t tabs'

#the <<NIRMAL is a "heredoc" or "here document". It is used to create a multi-line
#string, and you can use it by starting with << and all caps word, in this case NIRMAL.
#Ruby then reads everything into a string until it sees another NIRMAL in it, You can use
#anyword, not just NIRMAL.
poem = <<NIRMAL
\tThe lovely world
\twith logic so firmly planted
\tcannot discern \n\t the needs of love
\tnor comprehend passion from intuition
\tand requires an explanation
\n\t where there is none.
NIRMAL

puts "------------------------------------"
puts poem
puts "------------------------------------"

five = 10 - 2 + 3 - 6

puts "This should be five: #{five}"
#creating a function secret_formula that returns some values.
def secret_formula(started)
    jelly_beans = started * 500
    jars = jelly_beans / 1000
    crates = jars / 100
    return jelly_beans, jars , crates
end

start_point = 10000
beans , jars , crates = secret_formula(start_point)
puts jars

puts "With a starting point of : #{start_point}"
puts "We'd have #{beans} beans , #{jars} jars, and #{crates} crates."

start_point = start_point / 10
puts "We can also do that this way: "
# This line uses a C style of inserting variables into Ruby strings
puts "We'd have %s beans, %d jars ,and %d crates." %secret_formula(start_point)
