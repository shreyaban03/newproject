import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/storage_songs_model.dart';
import 'package:just_audio/just_audio.dart';
 // Assuming you have the Song model

class AudioPlayerPage extends StatefulWidget {
  final Song song;

  const AudioPlayerPage({Key? key, required this.song}) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAndPlayAudio();
  }

  // Load and start playing the selected song
  Future<void> _loadAndPlayAudio() async {
    try {
      await _audioPlayer.setFilePath(widget.song.path);
      _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  // Play/Pause functionality
  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // Seek to a new position
  void _seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Show song title
          Text(
            widget.song.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          
          // Play/Pause button
          IconButton(
            iconSize: 50,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _togglePlayPause,
          ),
          const SizedBox(height: 20),

          // Slider to seek audio
          StreamBuilder<Duration>(
            stream: _audioPlayer.positionStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final position = snapshot.data ?? Duration.zero;
                final duration = _audioPlayer.duration ?? Duration.zero;
                return Column(
                  children: [
                    Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _seekTo(Duration(seconds: value.toInt()));
                      },
                    ),
                    Text(
                      "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
