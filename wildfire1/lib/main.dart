import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/ui/views/dashboard/dashboard.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
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
          primarySwatch: Colors.blue,
        ),
        home: MenuScreen(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(414, 896),
    );
  }
}
