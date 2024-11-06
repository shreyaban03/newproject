import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';

class GenreCell extends StatelessWidget {
  final Map cObj;
  final VoidCallback onPressed;
  const GenreCell({super.key, required this.cObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(cObj["image"],width:double.maxFinite,height: double.maxFinite,
        fit:BoxFit.cover,
        ),

        Container(
          color: Colors.black54,
          width:double.maxFinite,height: double.maxFinite,

        ),
  Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(cObj["name"],style: TextStyle(color: TColor.primaryText,
      fontSize: 18,fontWeight:FontWeight.w700,
      ),),
  SizedBox(height: 5,),
       Text(cObj["songs"],style: TextStyle(color: TColor.primaryText,
      fontSize: 13,
      ),)
    ],
  ),
      ],
    );
  }
}