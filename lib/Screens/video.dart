import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
 late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller
    _videoPlayerController = VideoPlayerController.asset('assets/jordan.mp4');
    // Initialize the chewie controller
    _chewieController = ChewieController( 
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowMuting: true,
      showControls: true,
      showOptions: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.grey,
        bufferedColor: const Color.fromARGB(255, 95, 95, 95),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the video player controller and chewie controller
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
           Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Jordan Country in the Middle East Jordan, an Arab nation on the eastern bank of the Jordan River, is defined by ancient monuments, nature reserves and seaside resorts. Its home to the famous archaeological site of Petr  a, the Nabatean capital dating to around 300 B.C. Set in a narrow valley with tombs, temples, and monuments carved into the surrounding pink sandstone cliffs, Petra earns its nickname, the "Rose City." Capital: Amman',


              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
         
        ],
      ),
    );
  }
}
