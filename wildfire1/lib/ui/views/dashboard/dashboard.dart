import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/model/wildfire_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wildfire1/ui/views/reportafire.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen(
      {required this.viewAllUpdatesTap,
      required this.askAnythingTap,
      required this.imAliveTap});

  Function viewAllUpdatesTap;
  Function askAnythingTap;
  Function imAliveTap;
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

var firestore = FirebaseFirestore.instance.collection("WildfireUpdates");

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 79.h,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h, right: 16.w),
          child: Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 41.h,
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(left: 25.w),
              alignment: Alignment.centerLeft,
              color: Color.fromRGBO(8, 146, 133, 1),
              child: Text(
                "Recent Updates",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Container(
            height: 230.h,
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.orderBy("when", descending: true).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var wildfireUpdates = snapshot.data?.docs
                      .map((e) => WildfireUpdate.fromJson(e))
                      .toList();
                  print("fire ${snapshot.data?.docs[0].data()}");
                  return ListView.builder(
                    itemCount: wildfireUpdates?.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 29.w, right: 42.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/map-pin.svg"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    wildfireUpdates![index].location,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromRGBO(126, 122, 143, 1)),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SvgPicture.asset("assets/icons/ellipse.svg"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    timeago.format(
                                        wildfireUpdates[index].when.toDate()),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromRGBO(126, 122, 143, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                wildfireUpdates[index].details,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 11.h,
                              ),
                              SvgPicture.asset("assets/icons/line.svg"),
                              SizedBox(
                                height: 13.h,
                              ),
                            ]),
                      );
                    },
                  );
                }
                return Center(
                    child: Container(
                        height: 10.h,
                        width: 10.w,
                        child: CircularProgressIndicator()));
              },
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 21.w),
            child: Container(
              width: 377.w,
              height: 40.h,
              child: OutlinedButton(
                onPressed: () {
                  widget.viewAllUpdatesTap();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/icons/bell.svg"),
                    ),
                    SizedBox(width: 9.w),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "View all updates",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 98, 76, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                  primary: Colors.orange,
                  side: BorderSide(
                    width: 1.w,
                    color: Color.fromRGBO(255, 98, 76, 1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 400.h,
                    width: 414.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(8, 146, 133, 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          topLeft: Radius.circular(12.r)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 21.h,
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 13.w, right: 16.w),
                                child: Image.asset(
                                  "assets/images/firefighter.png",
                                  width: 385.w,
                                  height: 175.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 13.w, right: 16.w),
                                child: Image.asset(
                                  "assets/images/darken.png",
                                  width: 385.w,
                                  height: 175.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 24.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fire Safety Tips:",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "Test smoke detector batteries",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    "every 6 months to make sure they are",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    "still working.",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60.h, left: 340.w),
                              child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/arrow-right-circle.svg",
                                      height: 23.h,
                                      width: 23.w,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "More",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: (107.w),
                                  height: (103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FireReport(),
                                        ),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/edit.svg",
                                      height: 46.h,
                                      width: 46.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Report a Fire",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: (107.w),
                                  height: (103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      widget.imAliveTap();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/thumbsup.svg",
                                      height: 46.h,
                                      width: 46.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "I'm Alive",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: (107.w),
                                  height: (103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      widget.askAnythingTap();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/help-circle.svg",
                                      height: 46.h,
                                      width: 46.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Ask Anything",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
