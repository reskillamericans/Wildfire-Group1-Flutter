import 'package:cloud_firestore/cloud_firestore.dart';


class WildfireUpdate {
  String firstName;
  String lastName;
  String phoneNumber;
  String location;
  String details;
  Timestamp when;

  WildfireUpdate(
      {required this.firstName, required this.lastName, required this.phoneNumber,
        required this.location, required this.details, required this.when});

factory WildfireUpdate.fromJson(DocumentSnapshot data){
  return WildfireUpdate(firstName: data['firstName'],lastName: data['lastName'],phoneNumber:
  data['phoneNumber'],location: data['location'],details: data['details'],when: data['when'],);
}

Map<String,dynamic> toJson(){
  return{
    "firstName":firstName,
    "lastName":lastName,
    "phoneNumber":phoneNumber,
    "location":location,
    "details":details,
    "when":when,
    };
  }
}