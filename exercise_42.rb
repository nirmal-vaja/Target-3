## Animal is-a object
class Animal
    def animal?
        true
    end

    def say_hello(sound = nil)
        puts "#{sound} #{sound}"
    end
end

## Dog is-a Animal
class Dog < Animal
    def initialize(name)
        ## Dog has-a name
        @name = name
    end

    def say_hello()
        super("Woof")
    end
end

## Cat is-a Animal
class Cat < Animal
    def initialize(name)
        ## Cat has-a name
        @name = name
    end
    def say_hello()
        super("Meow")
    end
end

## Person is-a object 
class Person
    def initialize(name)
        ## Person has-a name
        @name = name
        ## Person has-a pet of some kind
        @pet = nil
    end
    attr_accessor :pet
end

## Employee is-a person
class Employee < Person
    def initialize(name, salary)
        ## when you invoke super,
        ## Ruby sends a message to the parent of the current object
        ## the current object is Employee and the parent is Person

        ## it asks it to invoke a method of the same name as
        ## the method invoking super (in this case, the method name is initialize)
        ## the arguments that were passed to the method are automatically forwaded
        ## here, the argument name is forwaded to the higher up method, Person inititalize method
        super(name)
        @salary = salary
    end
end

## Fish is-a object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end

## rover is-a dog
rover = Dog.new("Rover")

## satan is-a cat
satan = Cat.new("Satan")

## mary is-a person
mary = Person.new("Mary")

## mary has-a pet satan
mary.pet = satan

## frank is-a employee
frank = Employee.new("Frank", 1200000)

## frank has-a pet rover
frank.pet = rover

## flipper is-a fish
flipper = Fish.new()

## crouse is-a salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()

rover.say_hello()
satan.say_hello()