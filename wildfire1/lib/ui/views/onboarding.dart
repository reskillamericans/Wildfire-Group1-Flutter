import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var box = Hive.box("onboarding");
  late PageController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            onPageChanged: onchanged,
            controller: controller,
            children: [
              Column(children: [
                Container(
                  height: 266.h,
                  width: 266.w,
                  margin: EdgeInsets.only(top: 176.h),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(8, 146, 133, 1),
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      "assets/icons/bell_onboard.svg",
                      height: 102.h,
                      width: 102.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  "Get real-time information on fire outbreaks.",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Text(
                    "Use the app to get information, share safety measures, and report fire outbreaks to share with others near you.",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              Column(children: [
                Container(
                  height: 266.h,
                  width: 266.w,
                  margin: EdgeInsets.only(top: 176.h),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(8, 146, 133, 1),
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      "assets/icons/healthcard.svg",
                      height: 110.h,
                      width: 166.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  "Find your loved ones’ health status.",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Text(
                    "Use the “I’m Alive” feature to notify others about your safety during a nearby fire.",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              Column(children: [
                Container(
                  height: 266.h,
                  width: 266.w,
                  margin: EdgeInsets.only(top: 176.h),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(8, 146, 133, 1),
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      "assets/icons/hand_medical.svg",
                      height: 116.h,
                      width: 131.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  "Request help and emergency needs.",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Text(
                    "Let us know what you need during a fire outbreak. You can request help for food, transportation, and medical attention.",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ],
          ),
          Positioned(
            top: 690.h,
            left: 35.w,
            child: currentIndex == 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(8, 146, 133, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Color.fromRGBO(195, 199, 210, 1), width: 1.w),
                            ),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Color.fromRGBO(195, 199, 210, 1), width: 1.w),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 38.h,),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 344.w, height: 40.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 98, 77, 1),
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.nextPage(
                                duration: Duration(microseconds: 1),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MenuScreen()));
                          },
                          child: Text("Skip",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(195, 199, 210, 1)),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  )
                : Container(
                    color: Colors.transparent,
                  ),
          ),
          Positioned(
            top: 690.h,
            left: 35.w,
            child: currentIndex == 1
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(8, 146, 133, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(8, 146, 133, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Color.fromRGBO(195, 199, 210, 1), width: 1.w),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 38.h,),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 344.w, height: 40.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 98, 77, 1),
                            elevation: 0,
                          ),
                          onPressed: () {
                            controller.nextPage(
                                duration: Duration(microseconds: 1),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MenuScreen()));
                          },
                          child: Text("Skip",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(195, 199, 210, 1)),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  )
                : Container(
                    color: Colors.transparent,
                  ),
          ),
          Positioned(
            top: 690.h,
            left: 35.w,
            child: currentIndex == 2
                ? Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 12.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(8, 146, 133, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Container(
                          height: 12.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(8, 146, 133, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Container(
                          height: 12.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(8, 146, 133, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 38.h,),
                    ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 344.w, height: 40.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 98, 77, 1),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MenuScreen()));
                          },
                          child: Text("Get Started",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                  ],
                )
                : Container(
                    color: Colors.transparent,
                  ),
          ),
        ],
      ),
    );
  }

  onchanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
