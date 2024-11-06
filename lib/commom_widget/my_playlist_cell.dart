import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';

class  MyPlaylistCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const MyPlaylistCell({super.key, required this.pObj,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 90,
      child: Column(
        
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          
      
          
           Stack(
            alignment: Alignment.center,
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(pObj["image"],
              width: 150,
              height:90,
              fit: BoxFit.cover,)),
              Container(
                width: 150,
              height:90,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: TColor.primaryText28),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
      
               
      
      
           ],),
      
           const SizedBox(
            height: 12,
           ),
            Text(
                  pObj["name"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText60,
                  fontSize: 15
                  ,fontWeight: FontWeight.w700),),
           
      
      
          ],),
      
      );
  
  }
}