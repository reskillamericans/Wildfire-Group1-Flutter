
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:wildfire1/UI/views/Dashboard/dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WildfireApp());
}


class WildfireApp extends StatelessWidget {
  const WildfireApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Wildfire Notifications',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(414, 896),
    );
  }
}







