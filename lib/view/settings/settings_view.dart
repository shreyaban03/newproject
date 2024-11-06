import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/icon_text_row.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
          title: Text("Settings",style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600),),
            
          ),
          body: ListView(children: [
             IconTextRow(title:"Display", icon: "assets/images/display-frame.png", onTap: (){

             },),
              IconTextRow(title:"Audio", icon: "assets/images/speaker-filled-audio-tool.png", onTap: (){

             },),
              IconTextRow(title:"Headset", icon: "assets/images/headset.png", onTap: (){

             },),
              IconTextRow(title:"Lock Screen", icon: "assets/images/lock.png", onTap: (){

             },),
              IconTextRow(title:"Advanced ", icon: "assets/images/puzzle.png", onTap: (){

             },),
              IconTextRow(title:"Others", icon: "assets/images/ellipsis.png", onTap: (){

             },),
          ],),
    );
  }
}