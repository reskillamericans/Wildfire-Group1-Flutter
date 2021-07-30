import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:wildfire1/model/cloudresult.dart';
import 'package:wildfire1/logic/cloudstorage.dart';

class FireReport extends StatefulWidget {
  const FireReport({Key? key}) : super(key: key);

  @override
  _FireReportState createState() => _FireReportState();
}

var timestamp = new DateTime.now();
CloudStorageResult? uploadResult;


class _FireReportState extends State<FireReport> {
  TextEditingController detailsController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();
  final FocusNode _locationFocus = FocusNode();
  final FocusNode _detailsFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  CloudUpload upload = CloudUpload();

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(196, 196, 196, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 79.h,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h, right: 16.w),
          child: Text(
            "Report a Fire",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
                  "Give us more details",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 745.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 27.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28.h,
                        ),
                        Text(
                          "First Name",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
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
                                    _fieldFocusChange(context, _firstNameFocus,
                                        _lastNameFocus);
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
                          height: 8.h,
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
                              _fieldFocusChange(
                                  context, _lastNameFocus, _phoneNumberFocus);
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
                          height: 8.h,
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
                                  context, _phoneNumberFocus, _locationFocus);
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
                          height: 8.h,
                        ),
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          height: 40.h,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your location';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 13.sp),
                            textInputAction: TextInputAction.next,
                            focusNode: _locationFocus,
                            onFieldSubmitted: (value) {
                              _fieldFocusChange(
                                  context, _locationFocus, _detailsFocus);
                            },
                            controller: locationController,
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
                          "Incident Details",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "max 200 characters",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(126, 122, 143, 1),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Container(
                          height: 93.h,
                          child: Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter incident details';
                                }
                                return null;
                              },
                              style: TextStyle(fontSize: 13.sp),
                              textInputAction: TextInputAction.done,
                              focusNode: _detailsFocus,
                              onFieldSubmitted: (value) {
                                _detailsFocus.unfocus();
                              },
                              controller: detailsController,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
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
                          height: 8.h,
                        ),
                        Text(
                          "Add Photo",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Adding photos and videos is optional.",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(126, 122, 143, 1),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          width: 148.w,
                          height: 127.h,
                          child: pickedImage == null
                              ? OutlinedButton(
                                  onPressed: () async {
                                    final image = await selectImage();
                                    setState(() {
                                      pickedImage = image;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          "assets/icons/camera.svg",
                                          width: 24.w,
                                          height: 20.h,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Text(
                                        "Upload",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromRGBO(255, 98, 76, 1)),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        "Take a photo or select existing picture from your gallery",
                                        style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                126, 122, 143, 1)),
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                      side: BorderSide(
                                          width: 1.w,
                                          color:
                                              Color.fromRGBO(255, 98, 76, 1))),
                                )
                              : Image.file(pickedImage!),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        Container(
                          width: 362.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 98, 77, 1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (pickedImage!=null){
                                uploadResult =
                                await upload.imageUpload(pickedImage);}
                                CollectionReference WildfireUpdates =
                                    FirebaseFirestore.instance
                                        .collection("WildfireUpdates");
                                await WildfireUpdates.add({
                                  "firstName": firstNameController.text,
                                  "lastName": lastNameController.text,
                                  "phoneNumber": phoneNumberController.text,
                                  "location": locationController.text,
                                  "details": detailsController.text,
                                  "when": timestamp,
                                  "imageName": uploadResult?.imageName,
                                  "imageUrl": uploadResult?.imageUrl,
                                });
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              }
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          width: 362.w,
                          height: 40.h,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 98, 76, 1)),
                              textAlign: TextAlign.center,
                            ),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r)),
                                primary: Colors.white,
                                side: BorderSide(
                                    width: 1.w,
                                    color: Color.fromRGBO(255, 98, 76, 1))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<File> selectImage() async {
    final ImagePicker selectImage = ImagePicker();
    final XFile? selectedImage =
        await selectImage.pickImage(source: ImageSource.gallery);
    final path = File(selectedImage!.path);
    return path;
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
