import 'package:flutter/material.dart';
import 'package:hls_player/vlc.dart';
import 'package:yoyo_player/yoyo_player.dart';
import 'package:better_player/better_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://media.ewings.lk/ewgsstgnmdbkt-2020nov111234/media/masterplaylist1/master.m3u8",
      //"https://media.ewings.lk/ewgsstgnmdbkt-2020nov111234/media/test/380eec5b-244a-4c8b-9bf5-0fa47dd7129f.m3u8",
      liveStream: false,
    );
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //VLCUsage()
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _betterPlayerController,
              ),
              // child: YoYoPlayer(
              //   aspectRatio: 16 / 9,
              //   url:
              //       "https://media.ewings.lk/ewgsstgnmdbkt-2020nov111234/media/masterplaylist1/master.m3u8",
              //   videoStyle: VideoStyle(),
              //   videoLoadingStyle: VideoLoadingStyle(),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
