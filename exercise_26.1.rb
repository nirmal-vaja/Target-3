require './exercise_25.rb'

# This function will break up words for us.
def break_words(stuff)
	words = stuff.split(' ')
	return words
end

#Sort the words
def sort_words(words)
	return words.sort
end

#Prints the first word after popping it off
def prints_first_word(words)
	word = words.shift
	words.pop
	puts word
end

#Prints the last word after popping it off.
def prints_last_word(words)
	word = words.pop(1)
	puts word
end

#Takes in a full sentence and returns the sorted value.
def sort_sentence(sentence)
	words = break_words(sentence)
	return sort_words(words)
end

#Prints the first and last words of the sentence.
def print_first_and_last(sentence)
	words = break_words(sentence)
	prints_first_word(words)
	prints_last_word(words)
end

#Sorts the words then prints the first and last one.
def prints_first_and_last_sorted(sentence)
	words = sort_sentence(sentence)
	prints_first_word(words)
	prints_last_word(words)
end

