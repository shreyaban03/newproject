import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/my_playlist_cell.dart';
import 'package:flutter_application_1/commom_widget/playlist_songs_cell.dart';
import 'package:flutter_application_1/commom_widget/view_all_section.dart';
import 'package:flutter_application_1/view_model/playlist_view_model.dart';
import 'package:get/get.dart';

class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  final plVM = Get.put(PlaylistViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      }, child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset("assets/images/add.png"),
      ),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Obx(() => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20),
              gridDelegate:
          const   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
             2,childAspectRatio: 1.4,crossAxisSpacing: 10,mainAxisSpacing: 10),
             itemCount: plVM.playlistArr.length,
             itemBuilder:(context,index){
              var pObj=plVM.playlistArr[index];
             return MyPlaylistSongsCell(pObj: pObj, onPressed: (){}, onPressedPlay: (){},);
             }, ),),

            ViewAllSection(title:"My Playlist", onPressed: (){}),
            SizedBox(
              height: 150,
              child: Obx(() => ListView.builder(
    
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: 10),
    itemCount: plVM.myplaylistArr.length,
    itemBuilder:(context,index) {
        var pObj=plVM.myplaylistArr[index];

        return MyPlaylistCell(pObj: pObj, onPressed:(){},);
  }),),
            )
          ],
        ),
      ),
      
    );
  }
}