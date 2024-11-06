import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/player_bottom_button.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainPlayerView extends StatefulWidget {
  const MainPlayerView({super.key});

  @override
  State<MainPlayerView> createState() => _MainPlayerViewState();
}

class _MainPlayerViewState extends State<MainPlayerView> {

  
  

    
    
  @override
  Widget build(BuildContext context) {
    var media= MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Image.asset("assets/images/back.png",
          width:25 ,
          height: 25,
          color: Colors.white,
          fit: BoxFit.contain,
          )),
          title: Text("Now Playing",style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600),),
            actions: [
              IconButton(
          onPressed: (){
            
          }, 
          icon: Image.asset("assets/images/more.png",
          width:20 ,
          height: 20,
          color: TColor.primaryText80,
          fit: BoxFit.contain,
          
          )),
            ],
          ),
          body:
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

              children: [
             const   SizedBox(height: 20,),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(media.width*0.6),
                      child: Image.asset("assets/images/6ce59f9b-d0ea-4578-ad54-60fdc359b908.jpeg",width: media.width*0.7,
                      height: media.width*0.6,
                      fit:BoxFit.cover
                      ),
                    ),

                     SizedBox(
                       height: media.width*0.6,
                        width: media.width*0.6,
                       child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          customWidths:CustomSliderWidths(trackWidth: 4,progressBarWidth: 6, shadowWidth: 8),
                          customColors:  CustomSliderColors(
    dotColor:const Color(0xffFFB1B2),
    trackColor:const Color(0xffffffff).withOpacity(0.3),
    progressBarColors:const [Color(0xffFB9967), Color(0xffE9585A)],
    shadowColor:const Color(0xffFFB1B2),
    shadowMaxOpacity: 0.05),
                          infoProperties: InfoProperties(
                            topLabelStyle: const TextStyle(
                              color: Colors.transparent,fontSize:16,fontWeight: FontWeight.w400
                            ),
                            topLabelText: 'Elapsed',
                            bottomLabelStyle: const TextStyle(
                              color: Colors.transparent,fontSize: 16,fontWeight: FontWeight.w400
                            ),
                            bottomLabelText: 'time',
                            mainLabelStyle:
                             const TextStyle(
                              color: Colors.transparent,fontSize: 50.0,fontWeight: FontWeight.w600
                            ),
                          ),
                          startAngle: 270,
                          angleRange: 360,
                          size: 350.0),
                        
                       
                         min: 0,
                         max: 100,
                         initialValue: 60,
                         onChange: (double value) {
                           // callback providing a value while its being changed (with a pan gesture)
                         },
                         onChangeStart: (double startValue) {
                           // callback providing a starting value (when a pan gesture starts)
                         },
                         onChangeEnd: (double endValue) {
                           // ucallback providing an ending value (when a pan gesture ends)
                         },
                         
                       ),
                     )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text("3:15|4:26",style: TextStyle(
            color: TColor.secondaryText,
            fontSize: 18,),),

             const SizedBox(
                  height: 25,
                ),
                Text("Black or White",style: TextStyle(
            color: TColor.primaryText.withOpacity(0.9),
            fontSize: 23,
            fontWeight: FontWeight.w600),),

            const SizedBox(
                  height: 15,
                ),
                Text("Micheal Jackson|Album-Dangerous",style: TextStyle(
            color: TColor.secondaryText,
            fontSize: 18,),),

            const SizedBox(
                  height: 10,
                ),
            Image.asset("assets/images/—Pngtree—sound waves equalizer audio radio_9070974.png",fit: BoxFit.fitHeight,color: Colors.white,height:150,width:170 ),
              const Padding(padding:  EdgeInsets.all(20),
              child: Divider(
                color: Colors.white12,height:1
              ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(
                      width: 50,height: 50,
                      child:
                    IconButton(onPressed: (){}, icon: Image.asset("assets/images/previous-track.png",width: 40,height: 40,color: Colors.white,),),),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 50,height: 50,
                      child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/play-button-arrowhead.png",width: 40,height: 40,color: Colors.white,),)),
                    const SizedBox(width: 20,),
                     SizedBox(
                      width: 50,height: 50,
                      child:
                    IconButton(onPressed: (){}, icon: Image.asset("assets/images./play-next-button.png",width: 40,height: 40,color: Colors.white,),),),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     PlayerBottomButton(title: "playlist", icon: "assets/images/playlist.png", onPressed: (){}),
                     const SizedBox(width: 5,),
                      PlayerBottomButton(title: "shuffle", icon: "assets/images/shuffle.png", onPressed: (){}),
                       const SizedBox(width: 5,),
                       PlayerBottomButton(title: "repeat", icon: "assets/images/turn.png", onPressed: (){}),
                        const SizedBox(width: 5,),
                        PlayerBottomButton(title: "EQ", icon: "assets/images/equalizer.png", onPressed: (){}),
                         const SizedBox(width: 5,),
                       PlayerBottomButton(title: "favourites", icon: "assets/images/heart.png", onPressed: (){}),
                    
                      
                      ],

                    ),
                
              ],
            ),
              
          ),
          
    );
  }
}