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

          Get.to(() => const MainPlayerView());
        },);
  })),
    );
  }
}