import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/commom_widget/audio_player_page.dart';
import 'package:flutter_application_1/common/color_extension.dart';
import 'package:flutter_application_1/view_model/storage_songs_model.dart';
 // Assuming you have a Song model class

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Song> songs = [];

  // Function to pick and add audio files to the song list
  Future<void> _pickAudioFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio, // Only pick audio files
      allowMultiple: true, // Allow picking multiple files
    );

    if (result != null) {
      setState(() {
        // Add picked files to the songs list
        songs.addAll(result.files.map((file) {
          return Song(title: file.name, path: file.path!);
        }).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Music'),
        backgroundColor: TColor.bg,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _pickAudioFiles, // Trigger the file picker
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: songs.isEmpty
            ? const Center(child: Text("No songs available"))
            : ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return ListTile(
                    title: Text(song.title),
                    onTap: () {
                      // Navigate to the audio player page with the selected song
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerPage(song: song),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
