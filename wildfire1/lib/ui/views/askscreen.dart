import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AskScreen extends StatefulWidget{
  @override
  _AskScreenState createState() => _AskScreenState();
}
class _AskScreenState extends State<AskScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 146, 133, 1),
      body: Center(child: Text("COMING SOON!", style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w800),)),
    );
  }
}