import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchResultsListView(
        searchTerm: null
      ),

    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String? searchTerm;
  SearchResultsListView({Key? key, this.searchTerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(249, 249, 249, 1),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r), borderSide: const BorderSide(color: Color.fromRGBO(249, 249, 249, 1), width: 0.0),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r), borderSide: const BorderSide(color: Color.fromRGBO(249, 249, 249, 1), width: 0.0),),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: SvgPicture.asset("assets/icons/x-circle.svg",),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: SvgPicture.asset("assets/icons/search.svg",),
        ),
      ),
    );
  }
}


