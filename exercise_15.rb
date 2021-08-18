# This line takes the first argument for eg. ruby exercise_15.rb ex_sample.txt , so ex_sample.txt is an argument
filename = ARGV.first 
# opening the file that is passed in the argument.
txt = open(filename)

puts "Here's your file #{filename}: "
#printing the content of the opened file which is stored in the txt variable.
print txt.read

print "Type the filename again:"
# Getting the filename again from the user.
file_again = $stdin.gets.chomp
# opening the file that the user inputs.
txt_again = open(file_again)
#opening the file to read mode and printing the content of the file.    
print txt_again.read
