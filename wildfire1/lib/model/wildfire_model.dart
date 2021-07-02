import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WildfireUpdate {
  String firstName;
  String lastName;
  String phoneNumber;
  String location;
  String details;

  WildfireUpdate(
      {required this.firstName, required this.lastName, required this.phoneNumber,
        required this.location, required this.details});

factory WildfireUpdate.fromJson(DocumentSnapshot data){
  return WildfireUpdate(firstName: data['firstName'],lastName: data['lastName'],phoneNumber:
  data['phoneNumber'],location: data['location'],details: data['details']);
}

Map<String,dynamic> toJson(){
  return{
    "firstName":firstName,
    "lastName":lastName,
    "phoneNumber":phoneNumber,
    "location":location,
    "details":details,
    };
  }
}