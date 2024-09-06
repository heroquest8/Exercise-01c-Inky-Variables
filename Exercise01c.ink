/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
* Add four more knots
* ssign at least TWO new variables through player choices
* rint at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 Variable checking:
 
 Equality: "Tora" == "Tora"
 Not equality: 1 != 2
 Greater: >
 Less: <
 Greater or equal: >=
 Less or equal: <=
 
 
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR player_name = ""
VAR coins = 0


-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Tora] 
    ~ pet_name = "Tora" 
    -> cave_mouth
* [Chosito] 
    ~ pet_name = "Chosito" 
    -> cave_mouth
* [Ten] 
    ~ pet_name = "Ten" 
    -> cave_mouth
-> END

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave, if only {pet_name} could see you now!

You have {torches} torch(es) and {coins} coins.

{ coins == 10: You now have 10 coins, you could definitely use some more.| }
{ coins == 1000: You now have 1000 coins, a nice stash!| }
{ coins == 10000: You now have 10000 coins, might as well quit your job! Wait actually don't do that| }

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
-> END

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west

{ pet_name == "Tora": Tora would love it here in the west!| }
{ pet_name == "Chosito": Chosito would love it here in the west!| }
{ pet_name == "Ten": Ten wouldn't love it here in the west... he was always a scaredy cat.| }

+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
+ [Take some] -> moners
+ [Go back] -> cave_mouth
-> END

== moners ==
Ooh he stealin... how many coins do you want to take? Don't be shy...
+ [Just a handful...] -> some_doubloons
+ [Stuff your pockets completely] -> alot_doubloons
+ [Go crazy and take it all] -> all_doubloons
-> END

== some_doubloons ==
~ coins = coins + 10
Only that much? Someone feels guilty...
+ [Go back] -> cave_mouth
-> END

== alot_doubloons ==
~ coins = coins + 1000
Yeahh !! That's what I'm talkin' about !! 
+ [Go back] -> cave_mouth
-> END

== all_doubloons ==
~ coins = coins + 10000
DAMN, you must be REALLY broke...
+ [Go back] -> cave_mouth
-> END