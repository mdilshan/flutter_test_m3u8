import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VLCUsage extends StatefulWidget {
  @override
  _VLCUsageState createState() => _VLCUsageState();
}

class _VLCUsageState extends State<VLCUsage> {
  VlcPlayerController _videoPlayerController;

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      'https://storage.googleapis.com/media.ewings.lk/ewgsstgnmdbkt-2020nov111234/media/masterplaylist1/sample1.mp4',
      hwAcc: HwAcc.FULL,
      autoPlay: false,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    //await _videoViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
