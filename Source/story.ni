"Below" by "Benjamin L. Merritt"
The story headline is "An Interactive Adventure".
The story genre is "Fantasy".
The story creation year is 2016.

Include Basic Screen Effects by Emily Short.

Use full-length room descriptions.

Part 0 - Kinds

A backpack is a kind of player's holdall.
It is always wearable.
It is usually closed.

[TODO: have multiple levels of familiarity?]
A book is a kind of thing.
A book is either readable or unreadable.
It is usually readable.
A book can be openable. It is usually openable.
A book can be either open or closed.
It is usually closed.
It is usually proper-named.
It has some text called the title.
A book is either familiar or unfamiliar.
It is usually unfamiliar.
Rule for printing the name of a book (called the book) when the book is unfamiliar:
	say "a book titled [italic type][the title of the book][roman type]";
	now the book is familiar.
Rule for printing the name of a book (called the book) when the book is familiar:
	say "[italic type][the title of the book][roman type]".
Understand the title property as describing a book.

A spellbook is a kind of book.

Chapter 1 - Actions

Reading is an action applying to one thing.
The specification of the reading action is "Reading is basically like opening except that it involves opening openable objects first."
Understand the command "read" as something new.
Understand "read [something]" as reading.

[TODO: just defer to examining the object if it's unreadable? Don't even track readability?]
Check reading:
	if the noun is not readable:
		say "There's not much to read there." instead.

Before reading an openable thing:
	if the noun is closed:
		try opening the noun.

Carry out reading:
	try examining the noun instead.

[TODO: provide an exit-listing command (that doesn't list undiscovered hidden exits)]

Chapter 2 - Activities

To say more:
	say "[paragraph break][bracket]More[close bracket]";
	wait for any key;
	say "[paragraph break]".

Part 1 - Introduction

Late for Class is a scene.
Late for Class begins when play begins.
Late for Class ends when your spellbook is not disguised.

Your backpack is a backpack.
"Your backpack is old and faded but still sturdy."
It is worn by the player.


[TODO: describe the door, pavement, etc.]
The Crowded Courtyard is a room.
"You stand in a paved courtyard outside the Jameson Lecture Hall, which stands to the east. Students throng the courtyard."

The Jameson Lecture Hall is scenery in the Crowded Courtyard.
"The imposing lecture hall (constructed in 1893, according to the date engraved on its wall) casts a somber shadow over the courtyard."

Some people called the students are in the Crowded Courtyard.
"The courtyard is full of students of all descriptions. Most are strolling and chatting idly, but you notice a few jostling their way frantically through the crowd, clutching their book bags. They're probably just as late as you are."

Instead of opening your backpack during Late for Class:
	say "This is no time to be hunting through your backpack. You're late for class!".

Instead of going somewhere (called the destination) from the Crowded Courtyard
when the destination is not the Jameson Building Hallway
during Late for Class:
	say "You're already late for class. You'd better head straight to the lecture hall."


[TODO: allow "in" to get to the hallway.]
The Jameson Building Hallway is east of the Crowded Courtyard.
It is inside from the Crowded Courtyard.
"Doors line the walls of the short hallway. Your classroom is to the south: Room 193."

After going to the Jameson Building Hallway for the first time:
	say "You burst through the front door into a tiled hallway and immediately scan the doors, looking for your classroom.";
	continue the action. [Without this, the room description wouldn't be printed.]
Instead of going somewhere (called the destination) from the Jameson Building Hallway
when the destination is not Room 193
during Late for Class:
	say "Hold on! Your classroom isn't that way!".


Room 193 is south from the Jameson Building Hallway.
It is inside from the Jameson Building Hallway.
"Tiers of desks slope down to the front of the room, which is occupied by a large blackboard and a small table."

[TODO: room description and lecture fragments]
Your desk is a supporter in Room 193.
It is scenery.

Your spellbook is a privately-named spellbook.
Instead of examining the spellbook:
	say "[if disguised]Some student must have left it on the desk. [end if]The dark leather cover is old but supple, and the title is printed in gilded letters."
It has title "Grumman's Guide to Spelling".
Understand "book" as your spellbook.
Understand "spellbook" as your spellbook when your spellbook is not disguised.
Your spellbook can be disguised.
It is disguised.
It is on your desk.

Instead of reading your spellbook for the first time:
	say "The book seems to be just a huge list of words. The pages are old and slightly yellowed, but the text is still quite legible.".

Instead of reading your spellbook for the second time:
	say "As you page listlessly through the list of words, you notice that some of the spellings are rather archaic. Who would have brought such an old book into the lecture hall? Someone must have just wanted to get rid of it."
	
Instead of reading your spellbook for the third time:
	say "You're quickly growing bored with the spelling book, but you give it a cursory scan.";
	say "Just before you completely lose interest, you notice an unusual pair of words: '[italic type]sypra lum[roman type].' You murmur the peculiar words under your breath.";
	say "[bold type]Suddenly, the room plunges into darkness.[roman type][line break]";
	now Room 193 is not lighted;
	now your spellbook is not disguised;
	now the title of your spellbook is "Grumman's Guide to Spells";
	say "[more]";
	say "Confused shouts echo through the room, and you hear students groping toward the closed door. [run paragraph on]";
	[TODO: make sure the player can't leave any other important items.]
	if the player does not have your spellbook:
		say "You grab the book and jump to your feet.";
		silently try taking your spellbook;
	otherwise:
		say "You jump to your feet.";
	say "Someone pushes through the door, and, guided by the dim illumination, you follow with the other students.";
	try silently exiting; [to get off the chair]
	try exiting. [to leave the room]

Your chair is in Room 193.
Your chair can be enterable.
It is enterable.

After going to Room 193 during Late for Class:
	try silently entering your chair;
	say "You slip into the classroom and slide sheepishly into the closest available seat. The professor shoots you a disapproving glance before returning to her lecture.";
	continue the action.

Understand "stand" as exiting when the player is in your chair.

Instead of exiting from your chair when your spellbook is disguised:
	say "You've already made enough of a scene by coming in late. You'd better not draw any more attention.".


	