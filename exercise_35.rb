
# defining a function gold_room
def gold_room
    puts "\vThis room is full of gold. How much do you take?"

    print "\a\v> "
    #getting the user input in a variable
    choice = $stdin.gets.chomp

    if choice.to_i.is_a? Numeric
        #this block of code will run when user inputs the numeric value.
        how_much = choice.to_i
        if how_much < 50 
            #if the input of user is less than 50 then this block of code will run
            puts "Nice, you're not greedy, you win!"
            exit(0)
        else
            #else this block of code will run
            dead("You greedy bastard!")
        end
    else
        # if the user inputs a non-numeric character, this block of code will run
        dead("Man, learn to type a number.")
    end
end

#defining a function bear_room
def bear_room
    puts "\vThere is a bear here."
    puts "The bear has a bunch of honey."
    puts "The fat bear is in front of another door."
    puts "How are you going to move the bear?"

    #Initially, assigning false to bear_moved variable
    bear_moved = false

    while true
        print "\a\v> "
        # storing the user input into the variable
        choice = $stdin.gets.chomp

        if choice == "take honey"
            # if the input is "take honey".
            dead("The bear looks at you then slaps your face off.")
        elsif choice == "taunt bear" && !bear_moved
            # if the input is "taunt bear" and the variable bear_moved is set to false.
            puts "\vThe bear has moved from the door. You can go through it."
            bear_moved = true
        elsif choice == "taunt bear" && bear_moved
            #if the user input is "taunt bear" and bear_moved is set to true.
            dead("The bear get pissed off and chews your leg off.")
            start
        elsif choice == "open door" && bear_moved
            # if the input is open door and the variable bear_moved is set to true.
            gold_room
        else
            # if none of the condition matches.
            puts "\vI got no idea what that means!"
        end
    end
end

#defining the function cthulhu_room
def cthulhu_room
    puts "\vHere you see the great evil Cthulhu."
    puts "He, it, whatever stares at you and you go insane."
    puts "Do you flee for your life or eat your head?"
    # puts "flee or head??"
    print "\a\v> "
    #storing the user input in to the variable "choice"
    choice = $stdin.gets.chomp

    if choice.include? "flee"
        start
    elsif choice.include? "head"
        dead("Well that was tasty!")
    else
        cthulhu_room
    end
end

# dead function to simply print the statement passed in the argument.
def dead(why)
    puts "\v" + why
end

#defining the function start
def start
    puts "\vYou are in a dark room."
    puts "There is a door to your left and to your right."
    puts "Which one do you take?"

    print "\a\v> "
    # storing the user input in to the variable
    choice = $stdin.gets.chomp

    if choice == "left"
        bear_room
    elsif choice == "right"
        cthulhu_room
    else
        dead("You stumble around the room until you starve.")
    end
end

start