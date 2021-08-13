import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/model/askanything_model.dart';
import 'package:wildfire1/ui/views/menuscreen.dart';

class AskScreen extends StatefulWidget {
  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userQuestionsController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _userQuestionsFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  AskAnything? askAnything;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 79.h,
          title: Padding(
            padding: EdgeInsets.only(top: 25.h, right: 16.w),
            child: Text(
              "Ask Anything",
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
            color: Color.fromRGBO(255, 98, 77, 1),
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
                  padding: EdgeInsets.only(left: 6.w, right: 13.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Text("Ask us any questions that you want answered.",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "max 200 characters",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(24, 1, 38, 1),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        height: 139.h,
                        child: Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your questions';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            textInputAction: TextInputAction.next,
                            focusNode: _userQuestionsFocus,
                            onFieldSubmitted: (value) {
                              _fieldFocusChange(context, _userQuestionsFocus,
                                  _firstNameFocus);
                            },
                            controller: userQuestionsController,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.multiline,
                            maxLines: 7,
                            maxLength: 200,
                            decoration: InputDecoration(
                              counter: Offstage(),
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
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text("Request a user’s health status:",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Check on your loved ones status",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(24, 1, 38, 1),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(24, 1, 38, 1),
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
                              return "Please enter user's first name";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 13.sp),
                          textInputAction: TextInputAction.next,
                          focusNode: _firstNameFocus,
                          onFieldSubmitted: (value) {
                            _fieldFocusChange(
                                context, _firstNameFocus, _lastNameFocus);
                          },
                          controller: firstNameController,
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
                        "Last Name",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(24, 1, 38, 1),
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
                              return "Please enter user's last name";
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 13.sp),
                          textInputAction: TextInputAction.done,
                          focusNode: _lastNameFocus,
                          onFieldSubmitted: (value) {
                            _lastNameFocus.unfocus();
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
                        height: 291.h,
                      ),
                      Container(
                        width: 377.w,
                        height: 40.h,
                        child: OutlinedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              CollectionReference askAnything =
                                  FirebaseFirestore.instance
                                      .collection("AskAnything");
                              await askAnything.add({
                                "firstName": firstNameController.text,
                                "lastName": lastNameController.text,
                                "userQuestions": userQuestionsController.text,
                              }).then((onSuccess) {
                                firstNameController.clear();
                                lastNameController.clear();
                                userQuestionsController.clear();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MenuScreen()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("Submission Successful!"),
                                  ),
                                );
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Submit Question",
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
              ]),
            ),
          ),
        )));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
