import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TheDashboard extends StatefulWidget {
  @override
  _TheDashboardState createState() => _TheDashboardState();
}

class _TheDashboardState extends State<TheDashboard> {
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
          SizedBox(height: 13.h,),
          Container(
            height: 220.h,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 29.w, right: 42.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/map-pin.svg"),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "California",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(126, 122, 143, 1)),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset("assets/icons/ellipse.svg"),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "3hrs ago",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(126, 122, 143, 1)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, set do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        SvgPicture.asset("assets/icons/line.svg"),
                        SizedBox(
                          height: 13.h,
                        ),
                      ],

                    ),
                  );

                }),
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
                onPressed: () => {},
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
                    borderRadius: BorderRadius.circular(4.r)
                  ),
                  primary: Colors.orange,
                  side: BorderSide(width: 1.w,
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
                    height: 382.h,
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
                                padding: EdgeInsets.only(
                                    left: 13.w,
                                    right: 16.w),
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
                                padding: EdgeInsets.only(
                                    left: 13.w,
                                    right: 16.w),
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
                              padding: EdgeInsets.only(top:50.h, left: 333.w),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                        "assets/icons/arrow-right-circle.svg"),
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
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width:(107.w),
                                  height:(103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child:
                                        SvgPicture.asset("assets/icons/edit.svg"),
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
                                  width:(107.w),
                                  height:(103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: SvgPicture.asset(
                                        "assets/icons/thumbsup.svg",
                                      ),),
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
                                  width:(107.w),
                                  height:(103.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.r),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                        "assets/icons/help-circle.svg"),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 10.sp),
        selectedItemColor: Color.fromRGBO(255, 98, 77, 1),
        unselectedLabelStyle: TextStyle(fontSize: 10.sp),
        unselectedItemColor: Color.fromRGBO(195, 199, 210, 1),
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/home.svg"),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-thumbs-up.svg"),
              ),
              label: "Im Alive"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-bell.svg"),
              ),
              label: "Updates"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-help-circle.svg"),
              ),
              label: "Ask"),
        ],
      ),
    );
  }
}
