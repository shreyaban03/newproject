
import 'package:get/get.dart';

class AlbumsViewModel extends GetxController{
  final allList = [
    {
      "image":"assets/images/Heal the World by Michael Jackson on Apple Music.jpeg",
      "name":"History",
      "artists":"Micheal Jackson",
       "songs":"10 Songs"
    },
    {
      "image":"assets/images/Michael Jackson - Thriller Vinyl.jpeg",
      "name":"Thriller",
      "artists":"Micheal Jackson",
      "songs": "10 Songs"
    },
    {
      "image":"assets/images/It Won't Be Soon Before Long by Maroon 5.jpeg",
      "name":"It Won't Be Soon",
      "artists":"Maroon 5",
      "songs":"10 Songs"
    },
    {
      "image":"assets/images/6134cd1a-aae8-42f0-ae3a-8206048609a0.jpeg",
      "name":"I Am... Yours",
      "artists":"Beyonce",
      "songs":"10 Songs"
    },
    {
      "image":"assets/images/3f834092-0f9f-410a-a4cd-8acde72a8ffd.jpeg",
      "name":"Earth Song",
      "artists":"Micheal Jackson",
      "songs":"10 Songs"
    },
    {
      "image":"assets/images/SMOOTH CRIMINAL EN 1988.jpeg",
      "name":"Smooth Criminal ",
      "artists":"Micheal Jackson",
      "songs":"10 Songs"
    }

  ].obs;

  final PlayedArr=[{
  "duration":"3:56",
  "name":"Billie Jean",
  "artists":"Micheal Jackson"
},
{
  "duration":"3:56",
  "name":"Earth Song",
  "artists":"Micheal Jackson"
},
{
  "duration":"3:56",
  "name":"Mirror",
  "artists":"Justin Timberlake"
},
{
  "duration":"3:56",
  "name":"Remember The Time",
  "artists":"Micheal Jackson"
},
{
  "duration":"3:56",
  "name":"Black or White",
  "artists":"Micheal Jackson"
},
{
"duration":"3:56",
  "name":"Bad",
  "artists":"Micheal Jackson"
},
{
"duration":"3:56",
  "name":"She's Out Of My Life",
  "artists":"Micheal Jackson"
},

].obs;
}