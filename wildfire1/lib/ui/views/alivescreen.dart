import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wildfire1/model/alive_model.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';

class AliveScreen extends StatefulWidget {
  @override
  _AliveScreenState createState() => _AliveScreenState();
}

TextEditingController emergencyNameController = TextEditingController();
TextEditingController emergencyPhoneController = TextEditingController();
TextEditingController emergencyRelationshipController = TextEditingController();

final FocusNode _emergencyNameFocus = FocusNode();
final FocusNode _emergencyPhoneFocus = FocusNode();
final FocusNode _emergencyRelationshipFocus = FocusNode();

final _formKey = GlobalKey<FormState>();
EmergencyNeeds? emergencyNeeds;

class _AliveScreenState extends State<AliveScreen> {
  bool food = false;
  bool shelter = false;
  bool transportation = false;
  bool medicalCheck = false;
  bool other = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 79.h,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h, right: 16.w),
          child: Text(
            "I'm Alive",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 747.h,
          decoration: BoxDecoration(
            color: Color.fromRGBO(8, 146, 133, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r)),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 19.w, right: 18.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 9.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Text("Fill out the form to confirm health status.",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Emergency Contact’s Name (Full Name)",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your emergency contact's full name";
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            textInputAction: TextInputAction.next,
                            focusNode: _emergencyNameFocus,
                            onFieldSubmitted: (value) {
                              _fieldFocusChange(context, _emergencyNameFocus,
                                  _emergencyPhoneFocus);
                            },
                            controller: emergencyNameController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 10.sp,
                                  height: 0.15.h,
                                  color: Color.fromRGBO(139, 0, 0, 1)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Emergency Contact’s Phone Number",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your emergency contact's phone number";
                              } else if (value.length > 10 ||
                                  value.length < 10) {
                                return "Please enter your emergency contact's 10-digit phone number";
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            focusNode: _emergencyPhoneFocus,
                            onFieldSubmitted: (value) {
                              _fieldFocusChange(context, _emergencyPhoneFocus,
                                  _emergencyRelationshipFocus);
                            },
                            controller: emergencyPhoneController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 10.sp,
                                  height: 0.15.h,
                                  color: Color.fromRGBO(139, 0, 0, 1)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Relationship to Emergency Contact",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your relationship to your emergency contact";
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            textInputAction: TextInputAction.done,
                            focusNode: _emergencyRelationshipFocus,
                            onFieldSubmitted: (value) {
                              _emergencyRelationshipFocus.unfocus();
                            },
                            controller: emergencyRelationshipController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 10.sp,
                                  height: 0.15.h,
                                  color: Color.fromRGBO(139, 0, 0, 1)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(139, 0, 0, 1),
                                    width: 0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text("What do you need?",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          height: 35.h,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: food,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      food = value!;
                                    });
                                  }),
                              Text("Food",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Container(
                          height: 35.h,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: shelter,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      shelter = value!;
                                    });
                                  }),
                              Text("Shelter",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Container(
                          height: 35.h,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: transportation,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      transportation = value!;
                                    });
                                  }),
                              Text("Transportation",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Container(
                          height: 35.h,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: medicalCheck,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      medicalCheck = value!;
                                    });
                                  }),
                              Text("Medical Check",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Container(
                          height: 35.h,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: other,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      other = value!;
                                    });
                                  }),
                              Text("Other",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220.h,
                  ),
                  Container(
                    width: 377.w,
                    height: 40.h,
                    child: OutlinedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          CollectionReference emergencyNeeds = FirebaseFirestore
                              .instance
                              .collection("EmergencyNeeds");
                          await emergencyNeeds.add({
                            "emergencyName": emergencyNameController.text,
                            "emergencyPhone": emergencyPhoneController.text,
                            "emergencyRelationship":
                                emergencyRelationshipController.text,
                            "food": food,
                            "shelter": shelter,
                            "transportation": transportation,
                            "medicalCheck": medicalCheck,
                            "other": other,
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MenuScreen()));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              "assets/icons/tiny-thumbs-up.svg",
                              color: Color.fromRGBO(255, 98, 76, 1),
                              height: 20.h,
                              width: 19.68.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Mark Safe",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 98, 77, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
