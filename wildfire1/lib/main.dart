import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wildfire1/model/wildfire_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WildfireApp());
}


class WildfireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wildfire Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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

             var fireUpdates = snapshot.data?.docs.map((e) => WildfireUpdate.fromJson(e)).toList();
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

