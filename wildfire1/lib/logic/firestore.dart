// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wildfire1/utils/failure.dart';
//
// class Database{
//   CollectionReference newWildfireUpdates = FirebaseFirestore.instance.collection("newWildfireUpdates");
//
//   late String firstName; late String lastName; var phoneNumber; var location; late String details; /*late Timestamp when;*/
//
//   Future createUpdates(String? updateReport)async{
//     // FirebaseAuth auth = FirebaseAuth.instance;
//     try{
//       return await newWildfireUpdates.add({
//         "firstName" : firstName,
//         "lastName" : lastName,
//         "phoneNumber" : phoneNumber,
//         "location" : location,
//         "details" : details,
//         /*"when" : when,*/
//       });
//     } on FirebaseException{
//       throw Failure(message: "Failed to report fire");
//     } on SocketException{
//       throw Failure(message: "Internet connection failed");
//     } catch(e){
//       throw Failure(message: e.toString());
//     }
//   }
// }