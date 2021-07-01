import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheDashboard extends StatefulWidget {
  @override
  _TheDashboardState createState() => _TheDashboardState();
}

class _TheDashboardState extends State<TheDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 41,
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              color: Color.fromRGBO(8, 146, 133, 1),
              child: Text(
                "Recent Updates",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/map-pin.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "California",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(126, 122, 143, 1)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset("assets/icons/ellipse.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1hr ago",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(126, 122, 143, 1)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 60,
                  width: 333,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, set do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/line.svg"),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/map-pin.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "California",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(126, 122, 143, 1)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset("assets/icons/ellipse.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "3hrs ago",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(126, 122, 143, 1)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 60,
                  width: 333,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, set do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/line.svg"),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                child: Container(
                  width: 377,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset("assets/icons/bell.svg"),
                        ),
                        SizedBox(width: 7),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "View all updates",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 98, 76, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Color.fromRGBO(255, 98, 76, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 146, 133, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 13, right: 16),
                          child: Image.asset(
                            "assets/images/firefighter.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 13, right: 16),
                          child: Image.asset(
                            "assets/images/darken.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 16, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 103,
                                width: 107,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child:
                                      SvgPicture.asset("assets/icons/edit.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Report a Fire",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 103,
                                width: 107,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      "assets/icons/thumbsup.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "I'm Alive",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 103,
                                width: 107,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      "assets/icons/help-circle.svg"),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Ask Anything",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 41, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fire Safety Tips:",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 11),
                    Text(
                      "Test smoke detector batteries",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "every 6 months to make sure they are",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "still working.",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(315, 70, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                          "assets/icons/arrow-right-circle.svg"),
                    ),
                    /*Text(
                      "More",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.right,
                    ),*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(335, 107, 0, 0),
                child: Column(
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        alignment: Alignment.topCenter,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 10),
          selectedItemColor: Color.fromRGBO(255, 98, 77, 1),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          unselectedItemColor: Color.fromRGBO(195, 199, 210, 1),
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset("assets/icons/menu.svg"),
              ),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset("assets/icons/home.svg"),
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset("assets/icons/tiny-thumbs-up.svg"),
                ),
                label: "Im Alive"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset("assets/icons/tiny-bell.svg"),
                ),
                label: "Updates"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset("assets/icons/tiny-help-circle.svg"),
                ),
                label: "Ask"),
          ],
        ),
      ),
    );
  }
}