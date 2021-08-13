import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:wildfire1/ui/views/alivescreen.dart';
import 'package:wildfire1/ui/views/loginscreen.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:wildfire1/ui/views/onboarding.dart';
import 'package:wildfire1/ui/views/reportafire.dart';
import 'package:wildfire1/ui/views/signuppage.dart';
import 'package:wildfire1/ui/views/splashscreen.dart';
import 'package:hive/hive.dart';
import 'package:wildfire1/ui/views/updatesscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox("onboarding");

  runApp(WildfireApp());
}

class WildfireApp extends StatelessWidget {
  const WildfireApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild !=null){
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          title: 'Wildfire Notifications',
          initialRoute: "/",
          routes: {
            "/":(context) => SplashScreen(),
            "/menuscreen":(context) => MenuScreen(),
            "/loginscreen":(context) => LoginScreen(),
            "/signupscreen":(context) => SignUpPage(),
            "/firereportscreen":(context) => FireReport(),
            "/updatescreen":(context) => UpdatesScreen(),
            "/imalivescreen":(context) => AliveScreen(),
            "/onboardingscreen":(context) =>OnBoarding(),
          },
          debugShowCheckedModeBanner: false,
        ),
        designSize: const Size(414, 896),
      ),
    );
  }
}
