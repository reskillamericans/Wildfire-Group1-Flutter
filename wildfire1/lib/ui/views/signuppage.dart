import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wildfire1/logic/auth.dart';
import 'package:wildfire1/model/firebaseuser.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();

final FocusNode _firstNameFocus = FocusNode();
final FocusNode _lastNameFocus = FocusNode();
final FocusNode _phoneNumberFocus = FocusNode();
final FocusNode _emailFocus = FocusNode();
final FocusNode _passwordFocus = FocusNode();

final _formKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Color.fromRGBO(8, 146, 133, 1),
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(8, 146, 133, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120.h),
              child: SvgPicture.asset(
                "assets/icons/firelogo.svg",
                height: 38.67.h,
                width: 84.w,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WILDFIRE',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 36.w, right: 35.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "First Name",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                      focusNode: _firstNameFocus,
                                      onFieldSubmitted: (value) {
                                        _fieldFocusChange(context,
                                            _firstNameFocus, _lastNameFocus);
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(
                                            fontSize: 10.sp,
                                            height: 0.15.h,
                                            color:
                                                Color.fromRGBO(139, 0, 0, 1)),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 5.h),
                                        border: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(4.r),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.circular(4.r),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(139, 0, 0, 1),
                                              width: 1),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          borderSide: BorderSide(
                                              color:
                                                  Color.fromRGBO(139, 0, 0, 1),
                                              width: 0),
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
                              height: 6.h,
                            ),
                            Text(
                              "Last Name",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                focusNode: _lastNameFocus,
                                onFieldSubmitted: (value) {
                                  _fieldFocusChange(context, _lastNameFocus,
                                      _phoneNumberFocus);
                                },
                                controller: lastNameController,
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
                              height: 6.h,
                            ),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 13.sp),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                focusNode: _phoneNumberFocus,
                                onFieldSubmitted: (value) {
                                  _fieldFocusChange(
                                      context, _phoneNumberFocus, _emailFocus);
                                },
                                controller: phoneNumberController,
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
                              height: 6.h,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                    return 'Please enter your email address';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 13.sp),
                                textInputAction: TextInputAction.next,
                                focusNode: _emailFocus,
                                onFieldSubmitted: (value) {
                                  _fieldFocusChange(
                                      context, _emailFocus, _passwordFocus);
                                },
                                controller: emailController,
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
                              height: 6.h,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                  if (value!.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 13.sp),
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                focusNode: _passwordFocus,
                                onFieldSubmitted: (value) {
                                  _passwordFocus.unfocus();
                                },
                                controller: passwordController,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: 10.sp,
                                      height: 0.15.h,
                                      color: Color.fromRGBO(139, 0, 0, 1)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.h, horizontal: 10.w),
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
                              height: 2.h,
                            ),
                            Text(
                              "Password requires 6 characters",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 115.h,
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
                                  if (_formKey.currentState!.validate()) {
                                    CollectionReference UserUpdate =
                                        FirebaseFirestore.instance
                                            .collection("UserUpdate");
                                    await UserUpdate.add({
                                      "firstName": firstNameController.text,
                                      "lastName": lastNameController.text,
                                      "phoneNumber": phoneNumberController.text,
                                      "email": emailController.text,
                                    });
                                    await auth.signUp(
                                        email: emailController.text,
                                        password: passwordController.text);

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MenuScreen()));
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
