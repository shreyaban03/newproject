import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/icon_text_row.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view/device_storage/home_page.dart';
import 'package:flutter_application_1/view/home/home_view.dart';
import 'package:flutter_application_1/view/settings/settings_view.dart';
import 'package:flutter_application_1/view/songs/songs_view.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State <MainTabView> createState() =>  _MainTabViewState();
}

class  _MainTabViewState extends State <MainTabView> with SingleTickerProviderStateMixin{

  TabController? controller;
  int selectTab=0;

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      controller =TabController(length: 4, vsync: this);

      controller?.addListener(() {
        selectTab = controller?.index??0;
        setState(() {
          
        });

      }

      );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var media=MediaQuery.sizeOf(context);
    var splashVM=Get.find<SplashViewModel>();
    return Scaffold(
      key:splashVM.scaffoldKey,
      drawer: Drawer(
        backgroundColor:const Color(0xff10121D),
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(

           


            height: 240,
            child: DrawerHeader(
               decoration: BoxDecoration(
              color:TColor.primaryText.withOpacity(0.03),
            ),
              child: Column(children: [
              Image.asset("assets/images/music.png",width: media.width*0.17,),
              SizedBox(height: 20,),
                     const  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Column(
            
                  children: [
                  Text("328\nSongs",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffC1C0C0),
                  fontSize: 12),)
                ],),
                Column(
                  
                  children: [
                  Text("52\nAlbums",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffC1C0C0),
                  fontSize: 12),)
                ],),
                Column(
                  
                  children: [
                  Text("87\nArtists",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffC1C0C0),
                  fontSize: 12),)
                ],)
              ],)
            ],),
                     ),
          ),

            IconTextRow(title:"Themes", icon: "assets/images/theme.png", onTap: (){

             },),
               IconTextRow(title:"Ringtone Cutter", icon: "assets/images/ringtone.png", onTap: (){

             },),

              IconTextRow(title:"Sleep Timer", icon: "assets/images/alarm-clock.png", onTap: (){

             },),
              IconTextRow(title:"Equiliser", icon: "assets/images/preferences.png", onTap: (){

             },),
                IconTextRow(title:"Hidden Folder", icon: "assets/images/file.png", onTap: (){

             },),
               IconTextRow(title:"Scan Media", icon: "assets/images/scan.png", onTap: (){

             },),
        ],
        )),
             
          
           
             
                            
        
        
         
      body: TabBarView(controller: controller,children:[

      
        const HomeView(),
        
        
    const SongView(),
        
 const SettingsView(),

   HomePage(),
      ],),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: TColor.bg,boxShadow: const[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: Offset(0,-3)
          )
        ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          indicatorWeight: 1,
          labelColor: TColor.primary,
          labelStyle: const TextStyle(fontSize: 10),
          unselectedLabelColor: TColor.primaryText28,
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          
          tabs: [
          Tab(text: "Home",
         icon: Image.asset(selectTab==0?"assets/images/home.png":"assets/images/home.png",
         width: 20,height: 20,color: Colors.white,
         ),),
         Tab(text: "Songs",
         icon: Image.asset(selectTab==1?"assets/images/musical-note.png":"assets/images/musical-note.png",
         width: 20,height: 20,color: Colors.white
         ),),
                Tab(text: "Settings",
         icon: Image.asset(selectTab==2?"assets/images/setting.png":"assets/images/setting.png",
         width: 20,height: 20,color: Colors.white
         
         ),),
          Tab(text: "Local Music",
         icon: Image.asset(selectTab==3?"assets/images/storage-device.png":"assets/images/storage-device.png",
         width: 20,height: 20,color: Colors.white,
         ),),
        ]),),
      ),
      );
  }
}