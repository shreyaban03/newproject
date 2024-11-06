import 'package:get/get.dart';

class ArtistsViewModel  extends GetxController{
  final allList = [
    {
      "image":"assets/images/c9cde740-c020-4588-b66d-970094e2181a.jpeg",
      "name":"Beyonce",
      "albums":"4 albums",
      "songs":"38 songs"
    },
    {
       "image":"assets/images/37d8bea0-0a52-4169-8440-aba4291fb893.jpeg",
      "name":"Bebe Rexha",
      "albums":"2 albums",
      "songs":"18 songs"
    },
    {
       "image":"assets/images/Maroon5.jpeg",
      "name":"Maroon 5",
      "albums":"5 albums",
      "songs":"46 songs"
    },
    {
       "image":"assets/images/8ac07b17-c610-4077-a191-5ef071a8b225.jpeg",
      "name":"Micheal Jackson",
      "albums":"10 albums",
      "songs":"112 songs"
    },
    {
       "image":"assets/images/53945eee-2d21-4196-9c2c-3a18254e9acf.jpeg",
      "name":"Queens",
      "albums":"3 albums",
      "songs":"32 songs"
    },
    {
       "image":"assets/images/Yanni.jpeg",
      "name":"Yani",
      "albums":"1 album",
      "songs":"13 songs"
    }
  ].obs;

   final PlayedArr=[{
  "duration":"3:55",
  "name":"Crazy in Love",
  
},
{
  "duration":"4:32",
  "name":"Single Ladies",

},
{
  "duration":"2:56",
  "name":"If I Were a Boy ",
  
},
{
  "duration":"3:40",
  "name":"Love on Top",
  
},
{
  "duration":"3:28",
  "name":"Drunk in Love",
  
},
{
"duration":"4:56",
  "name":"Formation",

},
{
"duration":"3:50",
  "name":"XO",

},

].obs;

final albumsArr=[{
  "image":"assets/images/2e30542a-1760-406f-b31c-32049ebe3752.jpeg",
  "name":"Renaissance",
  "year":"2022"

},
{
"image":"assets/images/Beyoncé releases new album Lemonade.jpeg",
  "name":"Lemonade",
  "year":"2016"
},
{
  "image":"assets/images/6affb307-76ad-4749-8c09-ae0d4e1da04d.jpeg",
  "name":"B'Day",
  "year":"2006"
},
{
  "image":"assets/images/Dangerously In Love.jpeg",
  "name":"Dangerously in Love",
  "year":""
},
{
  "image":"assets/images/e4b8daa0-8a9c-4240-94ba-1f4ea168238f.jpeg",
  "name":"I Am...Sasha Fierce",
  "year":"2008"
},
{
  "image":"assets/images/Beyonc - Beyonce - CD.jpeg",
  "name":"Beyonce",
  "year":"2013"
},



].obs;
}