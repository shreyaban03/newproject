import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/album_songs_row.dart';
import 'package:flutter_application_1/commom_widget/artist_album_cell.dart';
import 'package:flutter_application_1/commom_widget/view_all_section.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view_model/artists_view_model.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class ArtistDetailsView extends StatefulWidget {
  const ArtistDetailsView({super.key});

  @override
  State<ArtistDetailsView> createState() => _ArtistDetailsViewState();
}

class _ArtistDetailsViewState extends State<ArtistDetailsView> {
  final artVM = Get.put(ArtistsViewModel());
 
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/images/back.png",
            width: 25,
            height: 25,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Artist Details",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
            },
            icon: Image.asset(
              "assets/images/search-interface-symbol.png",
              width: 20,
              height: 20,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Image.asset(
                          "assets/images/c9cde740-c020-4588-b66d-970094e2181a.jpeg",
                          width: double.maxFinite,
                          height: media.width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black54,
                      width: double.maxFinite,
                      height: media.width * 0.3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                               Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Beyonce",
                                      style: TextStyle(
                                        color: TColor.primaryText.withOpacity(0.9),
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "R&B . Pop . Funk ",
                                      style: TextStyle(
                                        color: TColor.primaryText.withOpacity(0.74),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          
                            
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "38.7M Followers",
                                  style: TextStyle(
                                    color: TColor.primaryText.withOpacity(0.74),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "55.1M listeners",
                                  style: TextStyle(
                                    color: TColor.primaryText.withOpacity(0.74),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                
                                   InkWell(
                                    borderRadius: BorderRadius.circular(17.5),
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: TColor.primaryG,
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                        ),
                                        borderRadius: BorderRadius.circular(17.5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "assets/images/icons8-add-50.png",
                                            width: 10,
                                            height: 10,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Follow",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: TColor.primaryText.withOpacity(0.74),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                
                              ],
                            ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
   
              const SizedBox(height: 10),
              ViewAllSection(title: "Top Albums", onPressed: () {}),
              const SizedBox(height: 8),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: artVM.albumsArr.length,
                  itemBuilder: (context, index) {
                    var aObj = artVM.albumsArr[index];
                    return ArtistAlbumCell(aObj: aObj);
                  },
                ),
              ),
              ViewAllSection(title: "Top Songs", onPressed: () {}),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: artVM.PlayedArr.length,
                itemBuilder: (context, index) {
                  var sObj = artVM.PlayedArr[index];
                  return AlbumSongsRow(
                    sObj: sObj,
                    onPressed: () {},
                    onPressedPlay: () {},
                    isPlay: index == 0,
                  );
                },
              ),],)
            ),),
          );
        
      
  
  }
}
