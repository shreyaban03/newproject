import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/playlist_cell.dart';
import 'package:flutter_application_1/commom_widget/recommended_cell.dart';
import 'package:flutter_application_1/commom_widget/songs_row.dart';
import 'package:flutter_application_1/commom_widget/title_section.dart';
import 'package:flutter_application_1/commom_widget/view_all_section.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view_model/home_view_model.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM=Get.put(HomeViewModel());
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
          title: Row(children: [
            Expanded(
              child: Container(
                height:38,
                
                decoration: BoxDecoration(
                  
                  color: const Color(0xff292E4B),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: TextField(
                  controller:homeVM.txtSearch.value,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 30,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/search-interface-symbol.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: TColor.primaryText28,
                      ),
                    ),
                    hintText: "Search Album Song",
                    hintStyle:  TextStyle(
                      color:TColor.primaryText28,
                      fontSize: 13,
                       )
                  ),
                ),
              ),
            )
          ],),
          ),
          body: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const TitleSection(title:"Hot Recommended"),
              SizedBox(
                height: 200,
                child:ListView.builder(
                  padding:const EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.hostRecommendedList.length,
                  itemBuilder: (context,index){

                    var mObj=homeVM.hostRecommendedList[index];
                  return RecommendedCell(mObj: mObj);


                  
                }),
              ),
              Divider(color:Colors.white.withOpacity(0.07),indent:20,endIndent: 20,),

              ViewAllSection(title: "Playlist", onPressed: (){},),

               SizedBox(
                height: 170,
                child:ListView.builder(
                  padding:const EdgeInsets.symmetric(horizontal:10,vertical:0 ),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeVM.playListArr.length,
                  itemBuilder: (context,index){

                    var mObj=homeVM.playListArr[index];
                  return PlayListCell(mObj: mObj);


                  
                }),
              ),

              Divider(color:Colors.white.withOpacity(0.07),indent:20,endIndent: 20,),

              ViewAllSection(title: "Recently Played", onPressed: (){},),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                 padding:const EdgeInsets.symmetric(horizontal:10,vertical:0 ),
                  itemCount: homeVM.recentlyPlayedArr.length,
                  itemBuilder: (context,index){

                    var sObj=homeVM.recentlyPlayedArr[index];
                  return SongsRow(sObj: sObj,onPressed: () {},
                  onPressedPlay: () {} ,
                  );


                  
                }),
            ],),
          ),

    );
  }
}