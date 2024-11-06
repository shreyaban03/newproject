import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';

class PlayListCell extends StatelessWidget {
final Map mObj;
  const PlayListCell({super.key,required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.asset(mObj["image"],
                          width:double.maxFinite,
                          height: 110,
                          fit: BoxFit.cover,
                          ),),
                         const  SizedBox(height: 15,),
                          Text(
                  mObj["name"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText60,
                  fontSize: 13
                  ,fontWeight: FontWeight.w700),),

                  Text(
                  mObj["artists"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.secondaryStart,
                  fontSize: 10
                  ,fontWeight: FontWeight.w700),),

                      ],
                    )
                  );
  }
}