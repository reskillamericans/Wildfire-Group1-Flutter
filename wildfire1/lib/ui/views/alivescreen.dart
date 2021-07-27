import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AliveScreen extends StatefulWidget{
  @override
  _AliveScreenState createState() => _AliveScreenState();
}
class _AliveScreenState extends State<AliveScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 146, 133, 1),
      body: Center(child: Text("COMING SOON!", style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w800),)),
    );
  }
}