import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';

class AlbumSongsRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;
  final bool isPlay;

  const AlbumSongsRow({super.key, required this.sObj,required this.onPressed,this.isPlay = false,required this.onPressedPlay});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Row(children: [
          IconButton(onPressed: onPressedPlay, icon: Image.asset("assets/images/play-button-arrowhead.png",width: 25,height: 25,color: Colors.white,),),
          Expanded(
            child:Text(
                  sObj["name"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText60,
                  fontSize: 13
                  ,fontWeight: FontWeight.w700),),),
              Text(
                  sObj["duration"],
                  maxLines: 1,
                style: TextStyle(
                  color: TColor.primaryText28,
                  fontSize: 18),),

                  Container(
                    width: 80
                    ,alignment: Alignment.centerRight,
                    child:isPlay? Image.asset("assets/images/equalizer.png",width: 60,height: 25,color: Colors.white,):Image.asset("assets/images/ellipsis.png",width: 25,height: 25,color: Colors.white,),
                  ),
                

          ],),
         
        ],

       
      
    );
  }
}