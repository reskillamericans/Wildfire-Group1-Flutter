import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:wildfire1/logic/auth.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';
import 'package:wildfire1/ui/views/signuppage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

final FocusNode emailFocus = FocusNode();
final FocusNode passwordFocus = FocusNode();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 146, 133, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 220.h),
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
              height: 44.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    width: 343.w,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: emailFocus,
                            onFieldSubmitted: (value) {
                              _fieldFocusChange(
                                  context, emailFocus, passwordFocus);
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 10.sp,
                                  height: 0.15.h,
                                  color: Color.fromRGBO(139, 0, 0, 1)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(4.r),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
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
                    width: 343.w,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            obscureText: true,
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            focusNode: passwordFocus,
                            onFieldSubmitted: (value) {
                              passwordFocus.unfocus();
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 10.sp,
                                  height: 0.15.h,
                                  color: Color.fromRGBO(139, 0, 0, 1)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(4.r),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 98, 77, 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await auth
                              .logIn(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((onSuccess) {
                            emailController.clear();
                            passwordController.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MenuScreen()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("Login Successful!"),
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
                        "Login",
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
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        emailController.clear();
                        passwordController.clear();
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700))),
                  SizedBox(
                    width: 30.w,
                  ),
                  VerticalDivider(thickness: 1.w, color: Colors.white),
                  SizedBox(
                    width: 30.w,
                  ),
                  TextButton(
                      onPressed: () {
                        emailController.clear();
                        passwordController.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpPage()));
                      },
                      child: Text("Create an Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700))),
                ],
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Container(
              width: 343.w,
              height: 40.h,
              child: OutlinedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MenuScreen()));
                },
                child: Center(
                  child: Text(
                    "Continue as a Guest",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 98, 76, 1),
                    ),
                  ),
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
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
