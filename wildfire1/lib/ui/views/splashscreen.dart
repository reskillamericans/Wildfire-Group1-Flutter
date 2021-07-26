import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:wildfire1/ui/views/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void open() async {
    await Hive.openBox("onboarding");
  }

  var box = Hive.box("onboarding");

  @override
  void initState() {
    Timer(
        Duration(seconds: 2), box.get("status") == "true" ? elseroute : route);
    super.initState();
  }

  route() {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => OnBoarding(),
      ),
    );
  }

  elseroute() {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MenuScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 146, 133, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 352.h),
            child: SvgPicture.asset(
              "assets/icons/firelogo.svg",
              height: 50.h,
              width: 109.w,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WILDFIRE',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
