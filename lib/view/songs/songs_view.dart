import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view/songs/albums_view.dart';
import 'package:flutter_application_1/view/songs/all_songs_view.dart';
import 'package:flutter_application_1/view/songs/artists_view.dart';
import 'package:flutter_application_1/view/songs/genres_view.dart';
import 'package:flutter_application_1/view/songs/playlist_view.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SongView extends StatefulWidget {
  const SongView({super.key});

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView> with SingleTickerProviderStateMixin {

  TabController? controller;
  int selectTab=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 5, vsync: this);
    controller?.addListener((){
 selectTab=controller?.index ??0;
 setState(() {
   
 });
    }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        leading: IconButton(
          onPressed: (){
            Get.find<SplashViewModel>().openDrawer();
          }, 
          icon: Image.asset("assets/images/bars-sort.png",
          width:25 ,
          height: 25,
          color: Colors.white,
          fit: BoxFit.contain,
          )),
          title: Text("Songs",style: TextStyle(
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
          body: Column(
            children: [
              SizedBox(
                height: kToolbarHeight-15,
                child: TabBar(controller:controller,
                            indicatorColor: TColor.focus,
                            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelStyle: TextStyle(color: TColor.primary,fontSize: 15,fontWeight: FontWeight.w600),
                unselectedLabelColor: TColor.primaryText80,
                unselectedLabelStyle: TextStyle(color: TColor.primaryText80,fontSize: 15,fontWeight: FontWeight.w600),
                tabs: const[
                  Tab(text: "All Songs",
                  height: 25,),
                  
                   Tab(text: "Playlists",),
                    Tab(text: "Albums",),
                     Tab(text: "Artists",),
                      Tab(text: "Genres"),
                ],),
              ),
           Expanded(
            child: TabBarView(
              controller: controller,
              children: [

                const AllSongsView(),
                const PlayListView(),
               const  AlbumsView(),
                const ArtistsView(),
               const GenresView(),
           ],)
           
            
          ),
            ],
          ),
    );
  }
}