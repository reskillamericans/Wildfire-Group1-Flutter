import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wildfire1/logic/auth.dart';
import 'package:wildfire1/model/wildfire_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wildfire1/ui/views/menuscreen.dart';
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

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

TextEditingController lemailController = TextEditingController();
TextEditingController lpasswordController = TextEditingController();

final FocusNode firstNameFocus = FocusNode();
final FocusNode lastNameFocus = FocusNode();
final FocusNode phoneNumberFocus = FocusNode();
final FocusNode emailFocus = FocusNode();
final FocusNode passwordFocus = FocusNode();

final FocusNode lemailFocus = FocusNode();
final FocusNode lpasswordFocus = FocusNode();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final GlobalKey<FormState> lformKey = GlobalKey<FormState>();

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Please enter your email address'),
  EmailValidator(errorText: 'Enter a valid email address')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(6,
      errorText: 'Password must be at least 6 characters long'),
]);

var firestore = FirebaseFirestore.instance.collection("WildfireUpdates");
User? user = FirebaseAuth.instance.currentUser;

class _DashboardScreenState extends State<DashboardScreen> {
  Auth auth = Auth();

  MenuScreen? menuScreen;

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
                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) {
                                        if (user != null) {
                                          widget.imAliveTap();
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r)),
                                                  child: Container(
                                                    height: 381.h,
                                                    width: 358.w,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            249, 249, 249, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16.r))),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 7.w),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 16.h,
                                                          ),
                                                          SvgPicture.asset(
                                                            "assets/icons/firelogo.svg",
                                                            height: 21.h,
                                                            width: 46.w,
                                                          ),
                                                          SizedBox(
                                                            height: 7.h,
                                                          ),
                                                          Text(
                                                            "WILDFIRE",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 18.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          SizedBox(
                                                            height: 18.h,
                                                          ),
                                                          Form(
                                                            key: lformKey,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Email",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Container(
                                                                  height: 40.h,
                                                                  width: 343.w,
                                                                  child: Column(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.isEmpty) {
                                                                              return 'Please enter your email address';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          style:
                                                                              TextStyle(fontSize: 13.sp),
                                                                          controller:
                                                                              lemailController,
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          focusNode:
                                                                              lemailFocus,
                                                                          onFieldSubmitted:
                                                                              (value) {
                                                                            _fieldFocusChange(
                                                                                context,
                                                                                lemailFocus,
                                                                                lpasswordFocus);
                                                                          },
                                                                          textAlignVertical:
                                                                              TextAlignVertical.center,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            errorStyle: TextStyle(
                                                                                fontSize: 10.sp,
                                                                                height: 0.15.h,
                                                                                color: Color.fromRGBO(139, 0, 0, 1)),
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 18.h,
                                                                ),
                                                                Text(
                                                                  "Password",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Container(
                                                                  height: 40.h,
                                                                  width: 343.w,
                                                                  child: Column(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if (value!.isEmpty) {
                                                                              return 'Please enter your password';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          style:
                                                                              TextStyle(fontSize: 13.sp),
                                                                          obscureText:
                                                                              true,
                                                                          controller:
                                                                              lpasswordController,
                                                                          textInputAction:
                                                                              TextInputAction.done,
                                                                          focusNode:
                                                                              lpasswordFocus,
                                                                          onFieldSubmitted:
                                                                              (value) {
                                                                            lpasswordFocus.unfocus();
                                                                          },
                                                                          textAlignVertical:
                                                                              TextAlignVertical.center,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            errorStyle: TextStyle(
                                                                                fontSize: 10.sp,
                                                                                height: 0.15.h,
                                                                                color: Color.fromRGBO(139, 0, 0, 1)),
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 38.h,
                                                                ),
                                                                Container(
                                                                  width: 343.w,
                                                                  height: 40.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            98,
                                                                            77,
                                                                            1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.r),
                                                                  ),
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      if (lformKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        await auth
                                                                            .logIn(
                                                                                email: lemailController.text,
                                                                                password: lpasswordController.text)
                                                                            .then((onSuccess) {
                                                                          lemailController
                                                                              .clear();
                                                                          lpasswordController
                                                                              .clear();
                                                                          Navigator.pop(
                                                                              context,
                                                                              widget.imAliveTap());
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(duration: Duration(seconds: 1),
                                                                              content: Text("Login Successful!"),
                                                                            ),
                                                                          );
                                                                        }).catchError((e) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(e.toString()),
                                                                            ),
                                                                          );
                                                                        });
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      "Login",
                                                                      style: TextStyle(
                                                                          fontSize: 13
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              Colors.white),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20.h,
                                                          ),
                                                          Container(
                                                            height: 40.h,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      lemailController
                                                                          .clear();
                                                                      lpasswordController
                                                                          .clear();
                                                                    },
                                                                    child: Text(
                                                                        "Forgot Password?",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 13.sp,
                                                                            fontWeight: FontWeight.w700))),
                                                                SizedBox(
                                                                  width: 20.w,
                                                                ),
                                                                VerticalDivider(
                                                                    thickness:
                                                                        1.w,
                                                                    color: Colors
                                                                        .black),
                                                                SizedBox(
                                                                  width: 20.w,
                                                                ),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return Dialog(
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                                                              child: Container(
                                                                                height: 496.h,
                                                                                width: 358.w,
                                                                                decoration: BoxDecoration(color: Color.fromRGBO(249, 249, 249, 1), borderRadius: BorderRadius.all(Radius.circular(16.r))),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 24.h,
                                                                                      ),
                                                                                      Text(
                                                                                        "Sign Up",
                                                                                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.sp, color: Colors.black),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 2.h,
                                                                                      ),
                                                                                      Form(
                                                                                        key: formKey,
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              "First Name",
                                                                                              style: TextStyle(
                                                                                                fontSize: 13.sp,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                color: Colors.black,
                                                                                              ),
                                                                                              textAlign: TextAlign.left,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: TextFormField(
                                                                                                      validator: (value) {
                                                                                                        if (value!.isEmpty) {
                                                                                                          return 'Please enter your first name';
                                                                                                        }
                                                                                                        return null;
                                                                                                      },
                                                                                                      style: TextStyle(fontSize: 13.sp),
                                                                                                      controller: firstNameController,
                                                                                                      textInputAction: TextInputAction.next,
                                                                                                      focusNode: firstNameFocus,
                                                                                                      onFieldSubmitted: (value) {
                                                                                                        _fieldFocusChange(context, firstNameFocus, lastNameFocus);
                                                                                                      },
                                                                                                      textAlignVertical: TextAlignVertical.center,
                                                                                                      decoration: InputDecoration(
                                                                                                        errorStyle: TextStyle(fontSize: 10.sp, height: 0.15.h, color: Color.fromRGBO(139, 0, 0, 1)),
                                                                                                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                                                        border: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(4.r),
                                                                                                          borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                        ),
                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(4.r),
                                                                                                          borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                        ),
                                                                                                        errorBorder: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(4.r),
                                                                                                          borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                                                        ),
                                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                                          borderRadius: BorderRadius.circular(4.r),
                                                                                                          borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                                                        ),
                                                                                                        filled: true,
                                                                                                        fillColor: Colors.white,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 3.h,
                                                                                            ),
                                                                                            Text(
                                                                                              "Last Name",
                                                                                              style: TextStyle(
                                                                                                fontSize: 13.sp,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                color: Colors.black,
                                                                                              ),
                                                                                              textAlign: TextAlign.left,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              child: TextFormField(
                                                                                                validator: (value) {
                                                                                                  if (value == null || value.isEmpty) {
                                                                                                    return 'Please enter your last name';
                                                                                                  }
                                                                                                  return null;
                                                                                                },
                                                                                                style: TextStyle(fontSize: 13.sp),
                                                                                                textInputAction: TextInputAction.next,
                                                                                                focusNode: lastNameFocus,
                                                                                                onFieldSubmitted: (value) {
                                                                                                  _fieldFocusChange(context, lastNameFocus, phoneNumberFocus);
                                                                                                },
                                                                                                controller: lastNameController,
                                                                                                textAlignVertical: TextAlignVertical.center,
                                                                                                decoration: InputDecoration(
                                                                                                  errorStyle: TextStyle(fontSize: 10.sp, height: 0.15.h, color: Color.fromRGBO(139, 0, 0, 1)),
                                                                                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                                                  border: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 3.h,
                                                                                            ),
                                                                                            Text(
                                                                                              "Phone Number",
                                                                                              style: TextStyle(
                                                                                                fontSize: 13.sp,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                color: Colors.black,
                                                                                              ),
                                                                                              textAlign: TextAlign.left,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              child: TextFormField(
                                                                                                validator: (value) {
                                                                                                  if (value == null || value.isEmpty) {
                                                                                                    return 'Please enter your phone number';
                                                                                                  } else if (value.length > 10 || value.length < 10) {
                                                                                                    return 'Please enter your 10-digit phone number';
                                                                                                  }
                                                                                                  return null;
                                                                                                },
                                                                                                style: TextStyle(fontSize: 13.sp),
                                                                                                keyboardType: TextInputType.number,
                                                                                                inputFormatters: [
                                                                                                  FilteringTextInputFormatter.digitsOnly
                                                                                                ],
                                                                                                textInputAction: TextInputAction.next,
                                                                                                focusNode: phoneNumberFocus,
                                                                                                onFieldSubmitted: (value) {
                                                                                                  _fieldFocusChange(context, phoneNumberFocus, emailFocus);
                                                                                                },
                                                                                                controller: phoneNumberController,
                                                                                                textAlignVertical: TextAlignVertical.center,
                                                                                                decoration: InputDecoration(
                                                                                                  errorStyle: TextStyle(fontSize: 10.sp, height: 0.15.h, color: Color.fromRGBO(139, 0, 0, 1)),
                                                                                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                                                  border: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 3.h,
                                                                                            ),
                                                                                            Text(
                                                                                              "Email",
                                                                                              style: TextStyle(
                                                                                                fontSize: 13.sp,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                color: Colors.black,
                                                                                              ),
                                                                                              textAlign: TextAlign.left,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              child: TextFormField(
                                                                                                validator: emailValidator,
                                                                                                style: TextStyle(fontSize: 13.sp),
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                textInputAction: TextInputAction.next,
                                                                                                focusNode: emailFocus,
                                                                                                onFieldSubmitted: (value) {
                                                                                                  _fieldFocusChange(context, emailFocus, passwordFocus);
                                                                                                },
                                                                                                controller: emailController,
                                                                                                textAlignVertical: TextAlignVertical.center,
                                                                                                decoration: InputDecoration(
                                                                                                  errorStyle: TextStyle(fontSize: 10.sp, height: 0.15.h, color: Color.fromRGBO(139, 0, 0, 1)),
                                                                                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                                                                                  border: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 3.h,
                                                                                            ),
                                                                                            Text(
                                                                                              "Password",
                                                                                              style: TextStyle(
                                                                                                fontSize: 13.sp,
                                                                                                fontWeight: FontWeight.w700,
                                                                                                color: Colors.black,
                                                                                              ),
                                                                                              textAlign: TextAlign.left,
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 4.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              child: TextFormField(
                                                                                                validator: passwordValidator,
                                                                                                style: TextStyle(fontSize: 13.sp),
                                                                                                obscureText: true,
                                                                                                textInputAction: TextInputAction.done,
                                                                                                focusNode: passwordFocus,
                                                                                                onFieldSubmitted: (value) {
                                                                                                  passwordFocus.unfocus();
                                                                                                },
                                                                                                controller: passwordController,
                                                                                                textAlignVertical: TextAlignVertical.top,
                                                                                                decoration: InputDecoration(
                                                                                                  errorStyle: TextStyle(fontSize: 10.sp, height: 0.15.h, color: Color.fromRGBO(139, 0, 0, 1)),
                                                                                                  contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                                                                                                  border: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(195, 199, 210, 1), width: 1.5),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 1),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderRadius: BorderRadius.circular(4.r),
                                                                                                    borderSide: BorderSide(color: Color.fromRGBO(139, 0, 0, 1), width: 0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 20.h,
                                                                                            ),
                                                                                            Container(
                                                                                              height: 40.h,
                                                                                              width: 343.w,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color.fromRGBO(255, 98, 77, 1),
                                                                                                borderRadius: BorderRadius.circular(4.r),
                                                                                              ),
                                                                                              child: TextButton(
                                                                                                onPressed: () async {
                                                                                                  if (formKey.currentState!.validate()) {
                                                                                                    await auth.signUp(email: emailController.text, password: passwordController.text).then((onSuccess) {
                                                                                                      CollectionReference UserUpdate = FirebaseFirestore.instance.collection("UserUpdate");
                                                                                                      UserUpdate.add({
                                                                                                        "firstName": firstNameController.text,
                                                                                                        "lastName": lastNameController.text,
                                                                                                        "phoneNumber": phoneNumberController.text,
                                                                                                        "email": emailController.text,
                                                                                                      });
                                                                                                      emailController.clear();
                                                                                                      passwordController.clear();
                                                                                                      firstNameController.clear();
                                                                                                      lastNameController.clear();
                                                                                                      phoneNumberController.clear();
                                                                                                      Navigator.pop(context, widget.imAliveTap());
                                                                                                      Navigator.pop(context, widget.imAliveTap());
                                                                                                      ScaffoldMessenger.of(context)
                                                                                                          .showSnackBar(
                                                                                                        SnackBar(duration: Duration(seconds: 1),
                                                                                                          content: Text("Registration Successful!"),
                                                                                                        ),
                                                                                                      );
                                                                                                    }).catchError((e) {
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(e.toString()),
                                                                                                        ),
                                                                                                      );
                                                                                                    });
                                                                                                  }
                                                                                                },
                                                                                                child: Text(
                                                                                                  "Sign Up",
                                                                                                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.white),
                                                                                                  textAlign: TextAlign.center,
                                                                                                ),
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 7.h,
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          borderRadius: BorderRadius.circular(4.r),
                                                                                        ),
                                                                                        width: 343.w,
                                                                                        height: 40.h,
                                                                                        child: OutlinedButton(
                                                                                          onPressed: () {
                                                                                            emailController.clear();
                                                                                            passwordController.clear();
                                                                                            firstNameController.clear();
                                                                                            lastNameController.clear();
                                                                                            phoneNumberController.clear();
                                                                                            Navigator.of(context).popUntil((route) => route.isFirst);
                                                                                          },
                                                                                          child: Text(
                                                                                            "Cancel",
                                                                                            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Color.fromRGBO(255, 98, 76, 1)),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)), primary: Colors.white, side: BorderSide(width: 1.w, color: Color.fromRGBO(255, 98, 76, 1))),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ));
                                                                        },
                                                                      );
                                                                      emailController
                                                                          .clear();
                                                                      passwordController
                                                                          .clear();
                                                                      firstNameController
                                                                          .clear();
                                                                      lastNameController
                                                                          .clear();
                                                                      phoneNumberController
                                                                          .clear();
                                                                      lemailController
                                                                          .clear();
                                                                      lpasswordController
                                                                          .clear();
                                                                    },
                                                                    child: Text(
                                                                        "Create an Account",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 13.sp,
                                                                            fontWeight: FontWeight.w700))),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          );
                                        }
                                      });
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
                                    onPressed: () {widget.viewAllUpdatesTap();},
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

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
