#this one is like your scripts with ARGV 
def print_two(*args)
    arg1 , arg2 = args
    puts "arg 1 : #{arg1} , arg 2 : #{arg2}"
end

#ok, that *args is actually pointless, we can just do this
def print_two_again(arg1 , arg2)
    puts "arg 1 : #{arg1} , arg 2 : #{arg2}"
end

#this just takes one argument
def print_one(arg1)
    puts "arg 1 : #{arg1}"
end

#this one takes no argument
def print_none()
    puts "I got nothin'."
end

print_two("Nirmal", "Vaja")
print_two_again("Nirmal", "Vaja")
print_one("First!")
print_none()