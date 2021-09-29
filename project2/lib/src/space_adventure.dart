import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';


class SpaceAdventure {

  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntro(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if(planetarySystem.hasPlanets) {
      travel(
        promptWhetherRandom(
          'Shall I randomly choose a planet for you to visit? (Y or N)'
        )
      );
    } else {
      print('Aw, there are no planets to explore.');
    }
  }

  void printGreeting() {
    print(
      'Welcome to the ${planetarySystem.name}!\n'
      'There are ${planetarySystem.numberOfPlanets} planets to explore.'
    );
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void printIntro(String name) {
    print(
      'Nice to meet you, $name.' 
      'My name is Eliza, I\'m an old friend of Alexa.'
    );
  }

   bool promptWhetherRandom(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        //invalid selection
        print('Sorry. I didn\'t get that.');
      }
    }
    return false;
  }

  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travel(bool randomDest) {
    Planet planet;
    if (randomDest) {
      //print details of random planet
      planet = planetarySystem.randomPlanet();
    } else {
      //allow user to choose
      planet = planetarySystem.planetWithName(
        responseToPrompt(
          'Name the planet you would like to visit.'
        )
      );
    }
    travelTo(planet);
  }

}
