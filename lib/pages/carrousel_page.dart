import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CarrouselPage extends StatefulWidget {
  @override
  _CarrouselPageState createState() => _CarrouselPageState();
}

class _CarrouselPageState extends State<CarrouselPage> {
  List<int> list = [1, 2, 3, 4, 5];
  String videoId;
  String videoId2;
  YoutubePlayerController _controller;
  YoutubePlayerController _controller2;
  List<Widget> listWidgets = [];
  int _current = 0;
  List<String> videos = [
    "https://www.youtube.com/watch?v=BBAyRBTfsOU",
    "https://www.youtube.com/watch?v=xBLtPDHvT44",
    "https://www.youtube.com/watch?v=tyLUBtJmDyc",
  ];

  @override
  void initState() {
    super.initState();
//    var controllers = createYoutubePlayer(videos);
//    youtubePlayer(controllers);
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=BBAyRBTfsOU");
    videoId2 = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=xBLtPDHvT44");

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: videoId2,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
      ),
    );

    listWidgets = [
      ClipRRect(
        child: Image.asset(
          'images/oficina.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Center(child: Text('1')),
        color: Colors.green,
      ),
      Container(
        child: Center(child: Text('2')),
        color: Colors.blue,
      ),
      YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        aspectRatio: 1.5,
        onReady: () {
          print('Player is ready.');
        },
      ),
      YoutubePlayer(
        controller: _controller2,
        aspectRatio: 1.5,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrousel '),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 1.50,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: listWidgets,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listWidgets.map((url) {
                  int index = listWidgets.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(255, 255, 255, 1)
                          : Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<YoutubePlayerController> createYoutubePlayer(List<String> videos) {
    var list = [];
    videos.forEach((video) {
      String videoId = YoutubePlayer.convertUrlToId(video);
      var controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: true,
        ),
      );
      list.add(controller);
    });
    return list;
  }

  List<Widget> youtubePlayer(List<YoutubePlayerController> controllers) {
    return controllers.map((controller) {
      listWidgets.add(
        YoutubePlayer(
          controller: controller,
          aspectRatio: 1.5,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
      );
    }).toList();
  }
}
