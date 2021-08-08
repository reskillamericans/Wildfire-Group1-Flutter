import 'package:flutter/material.dart';
import 'package:wildfire1/ui/views/alivescreen.dart';
import 'package:wildfire1/ui/views/askscreen.dart';
import 'package:wildfire1/ui/views/dashboard/dashboard.dart';
import 'package:wildfire1/ui/views/loginscreen.dart';
import 'package:wildfire1/ui/views/updatesscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  int _currentSelected = 1;
  late Widget currentPage;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    bottomPages = [
      DashboardScreen(
        viewAllUpdatesTap: () {
          _onItemTapped(3);
        },
        askAnythingTap: () {
          _onItemTapped(4);
        },
        imAliveTap: () {
          _onItemTapped(2);
        },
      ),
      DashboardScreen(
        viewAllUpdatesTap: () {
          _onItemTapped(3);
        },
        askAnythingTap: () {
          _onItemTapped(4);
        },
        imAliveTap: () {
          _onItemTapped(2);
        },
      ),
      AliveScreen(),
      UpdatesScreen(),
      AskScreen(),
    ];
  }

  void _onItemTapped(int index) {
    index == 0
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
      _currentSelected = index;
    });
  }

  List<Widget> bottomPages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: bottomPages.elementAt(
        _currentSelected,
      ),
      drawer: Drawer(
          child: Container(
            height: 896.h,
            width: 309.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 79.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w),
                  child: Text(
                    "Menu",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 14.h, bottom: 14.h),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 14.h, bottom: 14.h),
                  child: Text(
                    "Inbox",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 14.h, bottom: 14.h),
                  child: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.w, top: 14.h, bottom: 14.h),
                  child: Text(
                    "FAQ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, ),
                  child: TextButton(
                    onPressed: ()async{await auth.signOut(); Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginScreen()));},
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Color.fromRGBO(8, 146, 133, 1)),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(230, 235, 248, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 358.h, left: 16.w),
                  child: Container(
                    height: 45.h,
                    width: 277.w,
                    child: TextButton(
                      onPressed: () {Navigator.of(context)
                          .pop((route) => route.isFirst);},
                      child: Text(
                        "Close",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),),
                        backgroundColor: Color.fromRGBO(255, 98, 77, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        selectedItemColor: Color.fromRGBO(255, 98, 77, 1),
        unselectedLabelStyle:
        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        unselectedItemColor: Color.fromRGBO(195, 199, 210, 1),
        currentIndex: _currentSelected,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 24.h,
                width: 24.w,
                color: _currentSelected == 0
                    ? Color.fromRGBO(255, 98, 77, 1)
                    : Color.fromRGBO(195, 199, 210, 1),
              ),
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/home.svg",
                  height: 24.h,
                  width: 24.w,
                  color: _currentSelected == 1
                      ? Color.fromRGBO(255, 98, 77, 1)
                      : Color.fromRGBO(195, 199, 210, 1)),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-thumbs-up.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 2
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Im Alive"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-bell.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 3
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Updates"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-help-circle.svg",
                    height: 24.h,
                    width: 24.w,
                    color: _currentSelected == 4
                        ? Color.fromRGBO(255, 98, 77, 1)
                        : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Ask"),
        ],
      ),
    );
  }
}