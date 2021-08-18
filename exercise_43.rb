## Creating of a game named "Gothons from Planet Percal #25"
## It will be a small space adventure game.

#game scene
class Scene 
	def enter()
		puts "This scene is not yet configured. Subclass it and implement enter()"
		exit(1)
	end
end

## Game Engine
class Engine
	##  the initialization function that takes a scene_map parameter
	def initialize(scene_map)
		@scene_map = scene_map
	end
	
	def play()
		## from the scene_map , get the opening scene
		## as the current_scene
		current_scene = @scene_map.opening_scene()
		## the end scene is when you reach 'finished'
		last_scene = @scene_map.next_scene('finished')

		## While the current_scene is not the last_scene,
		## keep looping to not end the game
		while current_scene != last_scene
			## call the enter function on the current_scene
			## and store the returned value as the next_scene_name
			next_scene_name = current_scene.enter()
			## move to next_scene, the current_scene is now
			## an instance of the "next" scene
			current_scene = @scene_map.next_scene(next_scene_name)
		end
	end
end

## This is when the player dies and should be something funny.
class Death < Scene

	@@quips = [
		"\vYou died. You kinda suck at this.",
		"\vWomp Womp, Game over for you!",
		"\vLooks like you are a gooner.",
		"\vYou didn't make it, booohooo.",
		"\vSo long! Better luck next time.",
		"\vYour mom would be proud...if she were smarter.",
		"\vSuch a loser.",
		"\vI have a small puppy that's better at this."
	]

	def enter()
		puts @@quips [rand(0..(@@quips.length - 1))]
		exit(1)
	end
end

## This is the starting point.
## Player must defeat a Gothon who is already standing there, with a joke before continuing
class CentralCorridor < Scene
	def enter()
		puts '-' * 70
		puts "\v\bThe Gothons of Planet Percal #25 have invaded your ship and destroyed"
		puts "your entire crew. You are the last surviving member and your last"
		puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
		puts "put it in the bridge, and blow the ship up after getting into an"
		puts "escape pod."
		puts "\n"
		puts "You're running down the central corridor to the Weapon Armory when"
		puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
		puts "flowing around his hate filled body. He's blocking the door to the"
		puts "Armory and about to pull a weapon to blast you"
		puts "> "

		action = $stdin.gets.chomp

		if action.include?("shoot") || action.include?("attack")
			puts "You whip out your space pistol and shoot the Gothon."
			puts "The bullet bounces harmlessly off its scaly skin."
			puts "The Gothon roars in rage and jumps on you."
			puts "You fight valiantly but are eaten."
			return 'death'
		elsif action.include?("hide") || action.include?("run")
			puts "You scream in terror and look for a place to hide."
			puts "You run back the way you came, trying to open a door, any door."
			puts "Unfortunately the doors are all in lock down mode."
			puts "As you struggle with a door, the Gothon reaches for its space blaster and shoots you."
			return 'death'
		elsif action.include?("joke")
			puts "You remember a joke in Gothonese you learned at the Space Academy."
			puts "You tell the Gothon: meebop loolee tudee bakee, newhee moo!"
			puts "The Gothon starts laughing uncontrollably, falling down to the ground in laughter."
			puts "You quickly run past the Gothon and open the Armory door."
			return 'laser_armory'
		else
			puts "Action is not recognized!"
			return 'central_corridor'
		end
	end
end

## This is where the hero gets a neutron bomb to blow up the ship.
## There is a keypad where the player has to guess the number for
class LaserWeaponArmory < Scene
	def enter()
		puts "\vYou do a dive roll into the Weapon Armory, crouch and scan the rooom"
		puts "for more Gothons that might be hiding. It's dead quiet, too quiet."
		puts "You stand up and run to the far side of the room and find the"
		puts "neutron bomb in its container. There's a keypad lock on the box"
		puts "and you need to code to get the bomb out. If you get the code"
		puts "wrong 10 times then the lock closes forever and you can't"
		puts "get the bomb. The code is 3 digits."
		code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
		puts code
		print "[keypad]> "
		guess = $stdin.gets.chomp
		guess = code if guess == "cheat"
		guess_count = 1

		while guess != code && guess_count < 10
			puts "\aBZZZZZEEDDDDD!"
			guess_count += 1
			print "\v[keypad]> "
			guess = $stdin.gets.chomp
		end

		if guess == code 
			puts "The keypad turns green and the security container slowly opens with a hydraulic hiss."
			puts "You take the neutron bomb and run towards the bridge to set it up."
			return 'the_bridge'
		else
			puts "The keypad screen turns a deathly red, before a 10 second countdown starts."
			puts "You know you won't be able to get to the escape pods in time and sit there in shock."
			puts "Finally, there is a big flash and everything goes dark."
			return 'death'
		end
	end
end

## This is where the hero has a battle scene with a Gothon and places the bomb.
class TheBridge < Scene
	def enter()
		puts "You run onto the bridge with the neutron bomb."
		puts "A few Gothons are surprised and look at the bomb under your arm in fear."
		puts "They hold up their blasters but are wary of the bomb."
		print "Do you throw the bomb at them? > "

		throw_bomb = $stdin.gets.chomp.downcase

		if throw_bomb == "yes" || throw_bomb == "y"
			puts "You throw the bomb towards the Gothons in a panic and run for the door."
			puts "As soon as you throw the bomb, one of the Gothons shoots a laser jet at you."
			puts "As you fall, you feel your life slip away as you see the Gothons rush to disassemble the bomb."
			puts "Your last comfort is knowing they will probably join you when the bomb detonates."
			return 'death'
		elsif throw_bomb == "no" || throw_bomb == "n"
			puts "You lift the bomb threateningly and back toward the door."
			puts "The Gothons circle you slowly getting closer but you place the bomb quickly."
			puts "You jump back through the door and lock it, shooting the lock to smithereens so they can't get out."
			puts "Now, you have to get out of here! Run for the escape pod!"
			return 'escape_pod'
    	end
	end
end

## This is where the hero escapes, but only after guessing the right escape pod.
class EscapePod < Scene
	def enter()
		puts "You rush through the ship desperately trying to nake it to"
		puts "the escape pod before the whole ship explodes. It seems like"
		puts "hardly any Gothons are on the ship, so your run is clear off"
		puts "interference. You get to the chamber with the escape pods, and"
		puts "now need to pick one to take. Some of them could be damaged"
		puts "but you don't have time to look. There's 5 pods, which one"
		puts "do you take?"

		good_pod = rand(1..5)
		puts good_pod
		print "[pod #]> "
		guess = $stdin.gets.chomp.to_i
		guess = good_pod if guess == "cheat"

		if guess != good_pod 
			puts "You jump into pod %s and hit the eject button." %guess
			puts "The pod escapes out into the void of space, then"
			puts "implodes as the hull ruptures, crushing your body"
			puts "into jam jelly,"
			return 'death'
		else
			puts "You jump into pod %s and hit the eject button."%guess
			puts "The pod easily slides out into space heading to"
			puts "the planet below. As it flies to the planet, you look"
			puts "back and see your ship implode and then explode like a"
			puts "bright star, taking out the Gothon ship at the same"
			puts "time. YOU WON!"
			return 'finished'
		end
	end
end

## This is when the player finished the game
class Finished < Scene
	def enter()
		puts "You Won! Good Job."
	end
end

## Game map
class Map 

	@@scenes = {
		'central_corridor' => CentralCorridor.new(),
		'laser_weapon_armory' => LaserWeaponArmory.new(),
		'the_bridge' => TheBridge.new(),
		'escape_pod' => EscapePod.new(),
		'death' => Death.new(),
		'finished' => Finished.new() 
	}

	def initialize(start_scene)
		@start_scene = start_scene
	end

	## next_scene take a scene_name as a parameter,
	## and returns an instance of the next scene
	def next_scene(scene_name)
		val = @@scenes[scene_name]
		return val
	end

	## opening_scene calls the next_scene function
	## with a parameter of @start_scene
	def opening_scene()
		val = next_scene(@start_scene)
		return val
	end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()