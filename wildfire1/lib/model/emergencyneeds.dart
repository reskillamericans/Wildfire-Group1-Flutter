import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> emergencyNeeds(String emergencyName, String emergencyPhone,
    String emergencyRelationship, bool food, bool shelter, bool transportation, bool medicalCheck, bool other,) async {
  await FirebaseFirestore.instance.collection("EmergencyNeeds").add({
    "emergencyName": emergencyName,
    "emergencyPhone": emergencyPhone,
    "emergencyRelationship": emergencyRelationship,
    "food": food,
    "shelter": shelter,
    "transportation": transportation,
    "medicalCheck": medicalCheck,
    "other": other,
  });
}