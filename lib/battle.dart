import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({super.key, required this.onWin});

  final Function(int) onWin;

  @override
  State<StatefulWidget> createState() => _BattlePage();
}

class _BattlePage extends State<BattlePage> {
  VideoPlayerController? _videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset("battlevideo.mp4");
    _initializeVideoPlayerFuture = _videoPlayerController!.initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      _videoPlayerController!.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _videoPlayerController!.play();
    });

    super.initState();
  }

  Widget videoBox(BuildContext context) {
    if (_videoPlayerController == null ||
        _initializeVideoPlayerFuture == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _videoPlayerController!.dataSource.isNotEmpty) {
          //print('connection state');

          _videoPlayerController!.play();
          _videoPlayerController!;
          return AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            child: Stack(
              children: <Widget>[
                VideoPlayer(_videoPlayerController!),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Align(alignment: AlignmentDirectional.center);
                  },
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget.onWin(100);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            videoBox(context),
            SizedBox(height: 50),
            Text("You win!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("Reward: 100 pts!", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
