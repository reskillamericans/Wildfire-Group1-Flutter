import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WildfireUpdate {
  String firstName;
  String lastName;
  String phoneNumber;
  String location;
  String details;
  Timestamp when;
  String? imageUrl;
  String? imageName;

  WildfireUpdate(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.location,
      required this.details,
      required this.when,
      this.imageUrl,
      this.imageName});

  factory WildfireUpdate.fromJson(DocumentSnapshot data) {
    return WildfireUpdate(
        firstName: data['firstName'],
        lastName: data['lastName'],
        phoneNumber: data['phoneNumber'],
        location: data['location'],
        details: data['details'],
        when: data['when'],
        imageUrl: data['imageUrl'],
        imageName: data['imageName']);
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "location": location,
      "details": details,
      "when": when,
      "imageUrl": imageUrl,
      "imageName": imageName,
    };
  }
}
