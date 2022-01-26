import 'package:flutter/material.dart';
import 'package:sma_app/models/tagable.dart';
import 'package:sma_app/models/user.dart';

class UserService {
  List<SMAUser> users = [];
  UserService(){
    createUsers();
  }

  // User createUser(){
  //   return User()
  // }

  List<TagAble> createHobbies(){
    List<TagAble> hobbies = [];
    hobbies.add(TagAble("Tanzen", Colors.lightGreen[400]!));
    hobbies.add(TagAble("Fußball", Colors.lightGreen[400]!));
    hobbies.add(TagAble("Eislaufen", Colors.lightGreen[400]!));
    hobbies.add(TagAble("Skifahren", Colors.lightGreen[400]!));
    hobbies.add(TagAble("Volleayball", Colors.lightGreen[400]!));
    return hobbies;
  }

  List<TagAble> createAttributes(){
    List<TagAble> attributes = [];
    attributes.add(TagAble("Lesen", Colors.orange[300]!));
    attributes.add(TagAble("Klavier spielen", Colors.orange[300]!));
    attributes.add(TagAble("Singen", Colors.orange[300]!));
    return attributes;
  }

  List<TagAble> createSkills(){
    List<TagAble> skills = [];
    skills.add(TagAble("klein", Colors.indigo[300]!));
    skills.add(TagAble("süß", Colors.indigo[300]!));
    skills.add(TagAble("liebenswürdig", Colors.indigo[300]!));
    return skills;
  }

  createUsers(){
    users.add(SMAUser(createHobbies(), "Reiner", "Zufall", "Schlafe, mein Prinzchen, es ruhn Schäfchen und Vögelchen nun. Garten und Wiese verstummt, Auch nicht ein Bienchen mehr summt; Luna mit silbernem Schein Gucket zum Fenster herein."
              "Schlafe beim silbernen Schein, Schlafe, mein Prinzchen, schlaf' ein! Schlaf' ein, schlaf 'ein!", DateTime(1997, 12, 10), "Hagenberg", 1, createAttributes(), createSkills(), "männlich"));
  }

  SMAUser getUserById(int index){
    return users[index];
  }
}