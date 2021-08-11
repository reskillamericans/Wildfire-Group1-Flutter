import 'package:cloud_firestore/cloud_firestore.dart';

class AskAnything {
  String firstName;
  String lastName;
  String userQuestions;

  AskAnything(
      {required this.firstName,
        required this.lastName,
        required this.userQuestions,
      });

  factory AskAnything.fromJson(DocumentSnapshot data) {
    return AskAnything(
      firstName: data['firstName'],
      lastName: data['lastName'],
      userQuestions: data['userQuestions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userQuestions": userQuestions,
    };
  }

  Future<void> askAnything(String firstName, String lastName,
      String userQuestions,) async {
    await FirebaseFirestore.instance.collection("AskAnything").add({
      "firstName": firstName,
      "lastName": lastName,
      "userQuestions": userQuestions,
    });
  }

}
