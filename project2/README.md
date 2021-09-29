Taken from lecture videos 
Credit mostly given to OSU's Yong Bakos 

The program should be a command-line program, that expects the path to the JSON file as a command-line argument. The program should print the output and support the interaction shown in the screen specification.

Print a greeting including the name of the planetary system and the number of planets in the system.

Prompt the user to enter their name.

Echo back the user's name.

Prompt the user to make a choice about traveling to a random planet or not.

Re-prompt the user repeatedly until they enter Y or N.

Select a random planet and print its name and description when the user chooses to travel to a random planet.

Prompt the user to enter the name of a planet to travel to, if they chose not to travel to a random planet.

Display the name and description of the planet that the user specified.

Handle the case where the user enters the name of a planet that is not in the data file.

Terminates execution at the end of the above interaction.

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
