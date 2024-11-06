import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/album_songs_row.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view_model/albums_view_model.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class AlbumDetailsView extends StatefulWidget {
  const AlbumDetailsView({super.key});

  @override
  State<AlbumDetailsView> createState() => _AlbumDetailsViewState();
}

class _AlbumDetailsViewState extends State<AlbumDetailsView> {
   final albumVM = Get.put(AlbumsViewModel());
 
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
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
          title: Text("Album Details",style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600),),
            actions: [
              IconButton(
          onPressed: (){
            Get.find<SplashViewModel>().openDrawer();
          }, 
          icon: Image.asset("assets/images/search-interface-symbol.png",
          width:20 ,
          height: 20,
          color: Colors.white,
          fit: BoxFit.contain,
          
          )),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                        child: Image.asset("assets/images/Heal the World by Michael Jackson on Apple Music.jpeg",
                        width: double.maxFinite,
                        height: media.width*0.3,
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black54,
                       width: double.maxFinite,
                        height: media.width*0.3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset( "assets/images/Heal the World by Michael Jackson on Apple Music.jpeg",
                              width: 100,height: 100,
                              fit: BoxFit.cover,
                              ),
                            const SizedBox(width: 15,),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("History",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.9),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),),

                                  const SizedBox(height: 8,),

                                  Text("by Micheal Jackson",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),),

                                   const SizedBox(height: 8,),

                                  Text("1996 . 18 Songs . 64 min",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),),
                                ],
                              ))
                            ],
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            InkWell(
                               borderRadius: BorderRadius.circular(17.5),
                              onTap:(){},
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: TColor.primaryG,
                                  begin:Alignment.topCenter,
                                  end: Alignment.center,
                                  ),
                                  borderRadius: BorderRadius.circular(17.5)
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/images/play-button-arrowhead.png",
                                    width: 15,height: 15,
                                    fit:BoxFit.contain ,),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                     Text("Play",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),
                      InkWell(
                               borderRadius: BorderRadius.circular(17.5),
                              onTap:(){},
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                 border: Border.all(color: TColor.primaryText),
                                  borderRadius: BorderRadius.circular(17.5),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/images/share.png",color: Colors.white,
                                    width: 15,height: 15,
                                    fit:BoxFit.contain ,),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                     Text("Share",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                               borderRadius: BorderRadius.circular(17.5),
                              onTap:(){},
                              child: Container(
                                height: 30,
                                width: 140,
                                decoration: BoxDecoration(
                                 border: Border.all(color: TColor.primaryText),
                                  borderRadius: BorderRadius.circular(17.5),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/images/heart.png",color: TColor.primaryText,
                                    width: 15,height: 15,
                                    fit:BoxFit.contain ,),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                     Text("Add to favourites",style: TextStyle(
                                  color: TColor.primaryText.withOpacity(0.74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                            ),

                      ],)
                      

                        ],
                      ),
                    )
                  ],
                )
              ,ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                 padding:const EdgeInsets.symmetric(vertical:10 ),
                  itemCount: albumVM.PlayedArr.length,
                  itemBuilder: (context,index){

                    var sObj=albumVM.PlayedArr[index];
                  return AlbumSongsRow(sObj: sObj,onPressed: () {},
                  onPressedPlay: () {} ,
                  isPlay: index==0,
                  );


                  
                }),
             
              ],),
            ),
          )
    );
  }
}