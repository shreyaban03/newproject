import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';

class  AllSongRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;

  const AllSongRow({super.key, required this.sObj,required this.onPressed,required this.onPressedPlay});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        

        Row(children: [
         Stack(
          alignment: Alignment.center,
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(sObj["image"],
            width: 80,
            height: 80,
            fit: BoxFit.cover,)),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: TColor.primaryText28),
                borderRadius: BorderRadius.circular(50),
              ),
            ),

             Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: TColor.bg,
                borderRadius: BorderRadius.circular(25),
              ),
            ),


         ],),

         const SizedBox(
          width: 35,
         ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  sObj["name"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText60,
                  fontSize: 19
                  ,fontWeight: FontWeight.w700),),

                  Text(
                  sObj["artists"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText28,
                  fontSize: 14,
                  ),),

          ],)),
         
IconButton(onPressed: onPressedPlay, icon: Image.asset("assets/images/play-button-arrowhead.png",width: 25,height: 25,color: Colors.white,),),

        ],),

        Divider(color:Colors.white.withOpacity(0.07),indent:50,),
      ],
    );
  }
}