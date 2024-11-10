import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/all_song_row.dart';
import 'package:flutter_application_1/view/main_player/main_player_view.dart';
import 'package:flutter_application_1/view_model/all_songs_view_model.dart';
import 'package:get/get.dart';

class AllSongsView extends StatefulWidget {
  const AllSongsView ({super.key});

  @override
  State<AllSongsView > createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView > {

List<String> songUrls = [
  "https://www.drivehq.com/file/df.aspx/shareID46394/fileID873126/005 Michael Jackson - Billie Jean.mp3",
  "https://show2babi.com/downloading/11662/Michael-Jackson-Smooth-Criminal#google_vignette",
  "https://soundcloud.com/gotye/3-somebody-that-i-used-to-know?in=csm-o/sets/sad&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
];
  final allVM=Get.put(AllSongsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:
  
   Obx(() => ListView.builder(
    
    
    padding: EdgeInsets.all(20),
    itemCount: allVM.allList.length,
    itemBuilder:(context,index) {
        var sObj=allVM.allList[index];

        return AllSongRow (sObj: sObj,onPressed: () {} ,onPressedPlay: () {

          Get.to(() => MainPlayerView(songUrl: songUrls[index],));
        },);
  })),
    );
  }
}