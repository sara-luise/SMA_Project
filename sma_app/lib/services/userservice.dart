import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sma_app/models/message.dart';
import 'package:sma_app/models/tagable.dart';
import 'package:sma_app/models/user.dart';

class UserService {
  List<SMAUser> users = [];
  UserService(){
    createUsers();
  }


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
              "Schlafe beim silbernen Schein, Schlafe, mein Prinzchen, schlaf' ein! Schlaf' ein, schlaf 'ein!", DateTime(1997, 12, 10), "Hagenberg", 1, createAttributes(), createSkills(), "männlich", createMessages()));
    users.add(SMAUser(createHobbies(), "Albus", "Dumbledore", "Guten Tag i bims", DateTime(1997, 12, 10), "Hagenberg", 2, createAttributes(), createSkills(), "männlich", createMessages()));
    users.add(SMAUser(createHobbies(), "Lou", "Sari", "Guten Tag i bims hier", DateTime(1997, 12, 10), "Hagenberg", 3, createAttributes(), createSkills(), "männlich", createMessages()));
    users.add(SMAUser(createHobbies(), "Johann", "Exmatrikulator", "Wos mochst du heid so außer an schlechten Eindruck? Willst de Exmatrikulation glei oder erst speda?", DateTime(1997, 12, 10), "Hagenberg", 4, createAttributes(), createSkills(), "männlich", createMessages()));
  }

  List<Message> createMessages(){
    List<Message> messages = [];

    messages.add(Message(true, "Du bist so wunderschön i würd da gern a Angebot machen?", DateTime(2022, 1, 26, 20, 0)));
    messages.add(Message(false, "Äh ok ?", DateTime(2022, 1, 26, 20, 1)));
    messages.add(Message(true, "host vll 2000€ i bin zusätzlich nu BitCoin Investor, i verdreifach da ds :)", DateTime(2022, 1, 26, 20, 2)));
    messages.add(Message(false, "oh shit here we go again", DateTime(2022, 1, 26, 20, 4)));
    messages.add(Message(true, "also?", DateTime(2022, 1, 26, 20, 5)));
    messages.add(Message(true, "hä ghostest du mi jtz?", DateTime(2022, 1, 27, 20, 5)));
    // messages.add(Message(false, "", DateTime(2022, 1, 26, 20, 0)));
    return messages;
  }

  SMAUser currentUser(){
    return users[0];
  }

  List<SMAUser> getUsers(){
    return users.skip(1).toList();
  }

  SMAUser getUserById(int? id){
    for(var user in users){
      if(user.id == id){
        return user;
      }
    }

    return currentUser();
  }

  sendMessage(int? toUser, String message){
    if(toUser != null){
      for(var user in users){
        if(user.id == toUser){
          user.messages.add(Message(false, message, DateTime.now()));
        }
      }
    }
  }

  getGeoLocation() async {
    // final Geolocator geolocator = Geolocator.get
    if(await Permission.location.serviceStatus.isDisabled){
      final AndroidIntent intent = new AndroidIntent(
      action: 'android.permission.ACCESS_FINE_LOCATION',);
      await intent.launch();
    }
    if(await Permission.location.request().isGranted){
      Position pos = await determinePosition();
      print(pos);
      List<Placemark> placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude);
      for(var placemark in placemarks){
        return placemark.locality;
      }
    }
    // if(await Permission.location.isDenied){
    //   print(status);
    //   if(!status.isGranted){
    //     print("NOT GRANTED");
    //   }
    // }
    // else if(await Permission.locationWhenInUse.isGranted){
    //   // determinePosition();
    // }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}