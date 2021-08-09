import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/model/wildfire_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wildfire1/ui/views/searchbar.dart';
import 'package:wildfire1/ui/views/reportafire.dart';

class UpdatesScreen extends StatefulWidget {
  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

var firestore = FirebaseFirestore.instance.collection("WildfireUpdates");

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 79.h,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h, right: 16.w),
          child: Text(
            "Updates",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
            child: Container(
              height: 38.h,
              width: double.infinity,
              child: SearchBar(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11.r),
                      topLeft: Radius.circular(11.r)),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      firestore.orderBy("when", descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var wildfireUpdates = snapshot.data?.docs
                          .map((e) => WildfireUpdate.fromJson(e))
                          .toList();
                      print("fire ${snapshot.data?.docs[0].data()}");
                      return ListView.builder(
                        itemCount: wildfireUpdates?.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Divider(
                                height: 1.h,
                                color: Color.fromRGBO(229, 229, 229, 1),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 32.w,
                                              top: 13.h,
                                              bottom: 8.h),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/map-pin.svg",
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                wildfireUpdates![index]
                                                    .location,
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      126, 122, 143, 1),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              SvgPicture.asset(
                                                "assets/icons/ellipse.svg",
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                timeago.format(
                                                    wildfireUpdates[index]
                                                        .when
                                                        .toDate()),
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      126, 122, 143, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 287.w,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 32.w, bottom: 15.h),
                                            child: Text(
                                              wildfireUpdates[index].details,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, bottom: 10.h, left: 15.w),
                                    child: Container(
                                        width: 80.w,
                                        child:
                                            wildfireUpdates[index].imageUrl ==
                                                        null ||
                                                    wildfireUpdates[index]
                                                        .imageUrl!
                                                        .isEmpty
                                                ? FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: SvgPicture.asset(
                                                      "assets/icons/firelogo.svg",
                                                      color: Colors.white,
                                                      height: 10.h,
                                                      width: 10.w,
                                                    ))
                                                : FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Image.network(
                                                      wildfireUpdates[index]
                                                          .imageUrl!,
                                                      height: 80.h,
                                                      width: 80.w,
                                                    ),
                                                  )),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 15.h),
                              Divider(
                                height: 1.h,
                                color: Color.fromRGBO(229, 229, 229, 1),
                              ),
                            ],
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
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 39.h,
        width: 145.w,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FireReport(),
              ),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, top: 8.h, bottom: 8.h),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/flame.png",
                  height: 22.5.h,
                  width: 17.64.w,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Add Incident",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 13.sp),
                )
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(8, 146, 133, 1),
        ),
      ),
    );
  }
}
