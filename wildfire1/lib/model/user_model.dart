import 'package:cloud_firestore/cloud_firestore.dart';

class UserUpdate {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;


  UserUpdate(
      {required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        });

  factory UserUpdate.fromJson(DocumentSnapshot data) {
    return UserUpdate(
        firstName: data['firstName'],
        lastName: data['lastName'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,

    };
  }
}
