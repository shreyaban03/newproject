import 'package:get/get.dart';

class PlaylistViewModel extends GetxController{
  final playlistArr=[
    {
      "image":"assets/images/SpongeBob listening to music aesthetic.jpeg",
      "name":"My Top Tracks",
      "songs":"100 Songs"
    },
    {
      "image":"assets/images/de899330-7d82-4cf3-9fef-e2355397cb55.jpeg",
      "name":"Latest Added",
      "songs":"323 Songs"
    },
    {
      "image":"assets/images/d14551ac-eba3-4da3-acb6-f42d4c3e5f02.jpeg",
      "name":"History",
      "songs":"450 Songs"
    },
    {
      "image":"assets/images/728aea98-5061-45d7-ae07-cf28dfa5f409.jpeg",
      "name":"Favourites",
      "songs":"996 Songs"
    }
  ].obs;

  final myplaylistArr=[
    {
      "image":"assets/images/9bcccf36-022f-4949-843e-65294e9cc360.jpeg",
      "name":"Queens Collection"
    },
    {
      "image":"assets/images/Rihanna 2024 Songs Playlist 🎤  Greatest Hits Full Album _ Best of Rihanna.jpeg",
      "name":"Rihanna Collection"
    },
    {
      "image":"assets/images/Michael Jackson_ Bad.jpeg",
      "name":"MJ Collection"
    },
    {
      "image":"assets/images/618aeb9e-bc4b-49b3-929a-8050a2b8464e.jpeg",
      "name":"Classical Collection"
    }
  ].obs;
}