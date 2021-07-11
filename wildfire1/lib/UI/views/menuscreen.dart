import 'package:flutter/material.dart';
import 'package:wildfire1/ui/views/Dashboard/dashboard.dart';
import 'package:wildfire1/ui/views/alivescreen.dart';
import 'package:wildfire1/ui/views/askscreen.dart';
import 'package:wildfire1/ui/views/updatesscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  void initState(){
    super.initState();
    bottomPages =[
      MyHomePage(),
      AliveScreen(),
      UpdatesScreen(),
      AskScreen(),
    ];
  }
  void _onItemTapped(int index){
    index == 0
        ? _drawerKey.currentState?.openDrawer()
        : setState((){
      _currentSelected = index;
    });
  }
  List<Widget> bottomPages = [];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _drawerKey,
      body: bottomPages.elementAt(_currentSelected),
      drawer: Drawer(
          /*child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 92.h,
              ),
              Padding(padding: EdgeInsets.only(left:8.w),
                child: Text("Menu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),),),
              Divider(height: 2, color: Colors.grey,),],)*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 10.sp),
        selectedItemColor: Color.fromRGBO(255, 98, 77, 1),
        unselectedLabelStyle: TextStyle(fontSize: 10.sp),
        unselectedItemColor: Color.fromRGBO(195, 199, 210, 1),
        currentIndex: _currentSelected,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/menu.svg", color: _currentSelected == 0? Color.fromRGBO(255, 98, 77, 1) : Color.fromRGBO(195, 199, 210, 1)),
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SvgPicture.asset("assets/icons/home.svg", color: _currentSelected == 0? Color.fromRGBO(255, 98, 77, 1) : Color.fromRGBO(195, 199, 210, 1)),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-thumbs-up.svg", color: _currentSelected == 0? Color.fromRGBO(255, 98, 77, 1) : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Im Alive"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-bell.svg", color: _currentSelected == 0? Color.fromRGBO(255, 98, 77, 1) : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Updates"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SvgPicture.asset("assets/icons/tiny-help-circle.svg", color: _currentSelected == 0? Color.fromRGBO(255, 98, 77, 1) : Color.fromRGBO(195, 199, 210, 1)),
              ),
              label: "Ask"),
        ],
      ),);
    }}