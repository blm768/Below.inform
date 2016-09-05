"Below" by "Benjamin L. Merritt"
The story headline is "An Interactive Adventure".
The story genre is "Fantasy".
The story creation year is 2016.

Include Basic Screen Effects by Emily Short.

Use full-length room descriptions.

Part 0 - Definitions

Chapter 1 - Kinds

Section 1 - Backpack

A backpack is a kind of player's holdall.
It is always wearable.
It is usually closed.

Section 2 - Book

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

Section 3 - Spellbook

A spellbook is a kind of book.

[TODO:
Better chair dynamics?
*	Sitting/standing as distinct actions (so you can't "stand" to get out of a booth, for instance)
	*	Also supports standing on chairs.
*	Dropped items should end up on the chair's supporter, not on
	the chair. (See the "perch" example in the Inform docs.)
]

Chapter 2 - Actions

Section 1 - Reading

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

[TODO: provide an exit-listing command (that doesn't list undiscovered hidden exits)
and/or an exit indicator in the status bar]

Chapter 3 - Activities

Section 1 - Saying more

[Allows the creation of a "[more]" prompt]
To say more:
	say "[bracket]More[close bracket]";
	wait for any key;
	say "[paragraph break]".

Chapter 4 - Extensions to core rules

A thing can be animate or inanimate.
A thing is usually inanimate.

A person is always animate.

[TODO: convert to "traditional" rules?]
[TODO: cover other actions.]
Instead of touching or kissing an animate thing:
	say "[The noun] [might not like] that."

Part 1 - Equipment

Section 1 - Your backpack

Your backpack is a backpack.
"Your backpack is old and faded but still sturdy."
It is worn by the player.

Section 2 - Your spellbook

Your spellbook is a privately-named spellbook.
Instead of examining the spellbook:
	say "[if disguised]Some student must have left it on the desk. [end if]The dark leather cover is old but supple, and the title is printed in gilded letters."
It has title "Grumman's Guide to Spelling".
Understand "book" as your spellbook.
Understand "spellbook" as your spellbook when your spellbook is not disguised.
Your spellbook can be disguised.
It is disguised.
It is on your desk.

Part 2 - Scenery

Chapter 1 - Campus

[TODO:  implement the default actions to give messages that work for the crowd.]
The background students are a backdrop.
They are privately-named. The printed name is "students".
The description is "You see other students like these all the time. You barely give them a second glance."
The background students are animate.
Understand "students", "people", or "crowd" as the background students.

Section 1 - The Crowded Courtyard

[TODO: describe the door, pavement, etc.]
The Crowded Courtyard is a room.
"You stand in a paved courtyard outside the Jameson Lecture Hall, which stands to the east. Students of all descriptions throng the courtyard. Most are strolling and chatting idly, but you notice a few jostling their way frantically through the crowd, clutching their book bags.[if Late for Class is happening] They're probably just as late as you are.[end if]".

The Jameson Lecture Hall is scenery in the Crowded Courtyard.
The description is "The imposing lecture hall (constructed in 1893, according to the date engraved on its wall) casts a somber shadow over the courtyard."

The Jameson Building entrance is a door. It is east of the Crowded Courtyard.
It is open and scenery.
Understand "door" as the Jameson Building entrance.

The background students are here.

Section 2 - The Jameson Building Hallway

The Jameson Building Hallway is east of the Jameson Building entrance.
It is inside from the Crowded Courtyard.
"Doors line the walls of the short east-west hallway. Your classroom is to the south[if Late for Class is happening]: Room 193[end if]."

Section 3 - Room 193

Room 193 is south from the Jameson Building Hallway.
It is inside from the Jameson Building Hallway.
"Tiers of desks slope down to the front of the room, which is occupied by a large blackboard and a small table."

[TODO: room description and lecture fragments]
Your desk is a supporter in Room 193.
It is scenery.

Your spellbook is on your desk.

Your chair is a supporter in Room 193.
It is enterable and fixed in place.

Some people called your classmates are in Room 193.
Understand "students" as your classmates.
The description of your classmates is "[if Late for Class is happening][else][end if]" [TODO: write!]

Part 3 - Story

Chapter 1 - Late for Class

Late for Class is a scene.
Late for Class begins when play begins.
Late for Class ends when Room 193 is not lighted.

Before opening your backpack during Late for Class:
	[Don't open the backpack until the player has made it to class.]
	if the player had not been enclosed by Room 193:
		say "This is no time to be hunting through your backpack. You're late for class!" instead.

Section 1 - The Crowded Courtyard

Before going a direction (called thataway) in the Crowded Courtyard during Late for Class:
	If the room thataway from the location is not the Jameson Building Hallway:
		say "You're already late for class. You'd better head straight to the lecture hall." instead.

Section 2 - The Jameson Building Hallway

After going to the Jameson Building Hallway for the first time:
	say "You burst through the front door into a tiled hallway and immediately scan the doors, looking for your classroom.";
	continue the action. [Without this, the room description wouldn't be printed.]

Before going to somewhere (called the destination) from the Jameson Building Hallway during Late for Class:
	If the destination is not Room 193:
		say "Hold on! Your classroom isn't that way!" instead.

Section 3 - Room 193

After going to Room 193 during Late for Class:
	try silently entering your chair;
	say "You slip into the classroom and slide sheepishly into the closest available seat. The professor shoots you a disapproving glance before returning to her lecture.";
	continue the action.

Does the player mean entering your chair when the location is Room 193: it is likely.
[There's not really anything else on which to sit.]

Instead of exiting from your chair when your spellbook is disguised:
	say "You've already made enough of a scene by coming in late. You'd better not draw any more attention.".

Instead of reading your spellbook for the first time:
	say "You scan the first few pages. The book seems to contain a huge list of words, most of them rather obscure. The pages are old and slightly yellowed, but the text is still quite legible.".

Instead of reading your spellbook for the second time:
	say "As you flip listlessly through a few more pages, you notice that some of the spellings are rather archaic. Who would have brought such an old book into the lecture hall?"

Instead of reading your spellbook for the third time:
	say "You're growing bored with the spelling book, but you give it a cursory scan.";
	say "Just before you completely lose interest, you notice an unusual pair of words: '[italic type]sypra lum[roman type].' You murmur the peculiar words under your breath.";
	say "[bold type]A chill runs through you, and the room plunges into darkness.[roman type][paragraph break]";
	now Room 193 is not lighted;
	say "[more]";
	say "Confused shouts echo through the room, and the chairs bump and scrape as students grope toward the closed door. [run paragraph on]";
	[Grab anything that isn't nailed down. (Typical adventurer behavior.)]
	[TODO: factor this out as common code? (Create an action called looting or something?)]
	let the taken items be a list of things;
	repeat with item running through portable inanimate things enclosed by Room 193:
		if the player does not enclose the item:
			try silently taking the item;
			[TODO: "silently try" isn't silent, but Inform seems to accept it. File bug report?]
			add the item to the taken items;
	say "You [if the taken items is not empty]grab [the taken items] and[end if] jump to your feet.[paragraph break]";
	say "Someone pushes through the door, and, guided by the dim illumination, you follow with the other students.";
	move your classmates to the Jameson Building Hallway;
	[We reveal the spellbook after printing its (old) title so the player must examine it to see the new title.]
	[TODO: move this to a later point?]
	now your spellbook is not disguised;
	now the title of your spellbook is "Grumman's Guide to Spells";
	try silently exiting; [to get off the chair]
	try exiting. [to leave the room]

Chapter 2 - Investigating the Book

[TODO: figure out how to create a sense of urgency. (Someone will be along eventually to fix the lights; when that doesn't work, people may get suspicious.)]

Investigating the Book is a scene.
Investigating the Book begins when Late for Class ends.

When Investigating the Book begins:
	say "[italic type]That was weird. You feel that the blackout wasn't just a coincidence. Something's up with that book, and you'd better figure out what it is.[roman type]".

Instead of going to the Crowded Courtyard from the Jameson Building Hallway during Investigating the Book:
	say "It's pretty crowded out there. Given what just happened in the classroom, ". [TODO: finish writing!]
