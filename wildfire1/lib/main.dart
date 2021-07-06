import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:wildfire1/UI/views/Dashboard/dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/model/wildfire_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WildfireApp());
}


class WildfireApp extends StatelessWidget {
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


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var firestore = FirebaseFirestore.instance.collection("WildfireUpdates");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: firestore.snapshots(),
            builder: (context, snapshot) {

             var wildfireUpdates = snapshot.data?.docs.map((e) => WildfireUpdate.fromJson(e)).toList();
                            print("fire ${snapshot.data?.docs[0].data()}");
              return Text(
                'Latest Snapshot: ${DateTime.now()}',
                style: Theme.of(context).textTheme.caption,

              );
            },
          ),

        )

    );
  }
}
