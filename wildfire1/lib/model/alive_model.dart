import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyNeeds {
  String emergencyName;
  String emergencyPhone;
  String emergencyRelationship;
  bool food;
  bool shelter;
  bool transportation;
  bool medicalCheck;
  bool other;


  EmergencyNeeds(
      {required this.emergencyName,
        required this.emergencyPhone,
        required this.emergencyRelationship,
        required this.food,
        required this.shelter,
        required this.transportation,
        required this.medicalCheck,
        required this.other,
      });

  factory EmergencyNeeds.fromJson(DocumentSnapshot data) {
    return EmergencyNeeds(
      emergencyName: data['emergencyName'],
      emergencyPhone: data['emergencyPhone'],
      emergencyRelationship: data['emergencyRelationship'],
      food: data[bool],
      shelter: data[bool],
      transportation: data[bool],
      medicalCheck: data[bool],
      other: data[bool],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "emergencyName": emergencyName,
      "emergencyPhone": emergencyPhone,
      "emergencyRelationship": emergencyRelationship,
      "food": food,
      "shelter": shelter,
      "transportation": transportation,
      "medicalCheck": medicalCheck,
      "other": other,
    };
  }

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

}
