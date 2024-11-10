import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom_widget/player_bottom_button.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainPlayerView extends StatefulWidget {
   final String songUrl;
   
  const MainPlayerView({super.key, required this.songUrl});
  @override
  State<MainPlayerView> createState() => _MainPlayerViewState();
}

class _MainPlayerViewState extends State<MainPlayerView> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false; // Track the playing state

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize the audio player
    _loadAndPlayAudio(widget.songUrl); // Load and play the song

    // Listen to the player's playback state and update the isPlaying status
    _audioPlayer.playbackEventStream.listen((event) {
      setState(() {
        // Update isPlaying based on processingState and whether the player is currently playing
        isPlaying = event.processingState == ProcessingState.ready && _audioPlayer.playing;
      });
    });
  }

  Future<void> _loadAndPlayAudio(String url) async {
    try {
      await _audioPlayer.setUrl(url); // Load the audio from the URL
      _audioPlayer.play(); // Start playing the audio
      setState(() {
        isPlaying = true; // Mark as playing
      });
    } catch (e) {
      print("Error loading or playing the song: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Clean up the audio player when done
    super.dispose();
  }

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
          "Now Playing ${widget.songUrl}",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/more.png",
              width: 20,
              height: 20,
              color: TColor.primaryText80,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(media.width * 0.6),
                  child: Image.asset(
                    "assets/images/6ce59f9b-d0ea-4578-ad54-60fdc359b908.jpeg",
                    width: media.width * 0.7,
                    height: media.width * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.6,
                  width: media.width * 0.6,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        trackWidth: 4,
                        progressBarWidth: 6,
                        shadowWidth: 8,
                      ),
                      customColors: CustomSliderColors(
                        dotColor: const Color(0xffFFB1B2),
                        trackColor: const Color(0xffffffff).withOpacity(0.3),
                        progressBarColors: const [
                          Color(0xffFB9967),
                          Color(0xffE9585A)
                        ],
                        shadowColor: const Color(0xffFFB1B2),
                        shadowMaxOpacity: 0.05,
                      ),
                      infoProperties: InfoProperties(
                        topLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        topLabelText: 'Elapsed',
                        bottomLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        bottomLabelText: 'time',
                        mainLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      startAngle: 270,
                      angleRange: 360,
                      size: 350.0,
                    ),
                    min: 0,
                    max: 100,
                    initialValue: 60,
                    onChange: (double value) {},
                    onChangeStart: (double startValue) {},
                    onChangeEnd: (double endValue) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "3:15|4:26",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Black or White",
              style: TextStyle(
                color: TColor.primaryText.withOpacity(0.9),
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Micheal Jackson|Album-Dangerous",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/—Pngtree—sound waves equalizer audio radio_9070974.png",
              fit: BoxFit.fitHeight,
              color: Colors.white,
              height: 150,
              width: 170,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(
                color: Colors.white12,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.skip_previous_outlined,color: Colors.white,)
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause_circle_filled_outlined : Icons.play_arrow_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isPlaying) {
                          _audioPlayer.pause();
                        } else {
                          _audioPlayer.play();
                        }
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.skip_next_outlined,color: Colors.white,)
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _audioPlayer.stop();
                      setState(() {
                        isPlaying = false; // Mark as stopped
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerBottomButton(title: "playlist", icon: "assets/images/playlist.png", onPressed: () {}),
                const SizedBox(width: 5),
                PlayerBottomButton(title: "shuffle", icon: "assets/images/shuffle.png", onPressed: () {}),
                const SizedBox(width: 5),
                PlayerBottomButton(title: "repeat", icon: "assets/images/turn.png", onPressed: () {}),
                const SizedBox(width: 5),
                PlayerBottomButton(title: "EQ", icon: "assets/images/equalizer.png", onPressed: () {}),
                const SizedBox(width: 5),
                PlayerBottomButton(title: "favourites", icon: "assets/images/heart.png", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
