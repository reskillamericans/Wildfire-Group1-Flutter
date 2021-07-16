import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/model/wildfire_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wildfire1/ui/views/searchbar.dart';

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
      body:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
            child: Container(
              height: 38.h,
              width:double.infinity,
              child: SearchBar(),),
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
                  stream: firestore.snapshots(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 13.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32.w),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/map-pin.svg",
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        wildfireUpdates![index].location,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(126, 122, 143, 1),),
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
                                            wildfireUpdates[index].when.toDate()),
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(126, 122, 143, 1),),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32.w, right: 15.w),
                                  child: Text(
                                    wildfireUpdates[index].details,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                /*SvgPicture.asset("assets/icons/line.svg"),*/
                                Divider(
                                  height: 1.h,
                                  color: Color.fromRGBO(229, 229, 229, 1),
                                ),
                              ]);
                        },
                      );
                    }
                    return CircularProgressIndicator();
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
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 19.w, top: 8.h, bottom: 8.h),
            child: Row(
              children: [
                Image.asset("assets/icons/flame.png", height: 22.5.h, width: 17.64.w,),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Add Incident",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.sp),
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
