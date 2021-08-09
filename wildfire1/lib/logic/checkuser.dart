// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/widgets.dart';
// import 'package:wildfire1/ui/views/alivescreen.dart';
// import 'package:wildfire1/ui/views/loginscreen.dart';
//
// class DashboardScreen extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context){
//     return FutureBuilder<User>(
//         future: FirebaseAuth.instance.currentUser,
//         builder: (BuildContext context, AsyncSnapshot<User> snapshot){
//           if (snapshot.hasData){
//             User? user = snapshot.data;
//
//             return AliveScreen();
//           }
//
//           return LoginScreen();
//         }
//     );
//   }
// }