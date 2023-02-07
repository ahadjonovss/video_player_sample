import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SingleVideoPage extends StatefulWidget {
  const SingleVideoPage({Key? key}) : super(key: key);

  @override
  State<SingleVideoPage> createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/1.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body:Column(
          children: [
            if(_controller.value.isInitialized)
            OrientationBuilder(
              builder: (context, orientation) {
                if(mediaQueryData.orientation==Orientation.portrait){
                  return SafeArea(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  );
                }else{
                  return SizedBox(
                    height: mediaQueryData.size.height,
                    width: mediaQueryData.size.width,
                    child: VideoPlayer(_controller),
                  );
                }

              },
            ),
            SizedBox(
              height: 90,
              width: 400,
              child: Column(
                children: [
                  Slider(
                    value: 10,
                    max: 40,
                    inactiveColor: Colors.black,
                    onChanged: (value) {

                  },),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              InkWell(
                                onTap: () {
                                  _controller.play();
                                },
                                  child: Icon(Icons.play_circle)),
                              Icon(Icons.skip_next),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40,),
                        SizedBox(
                          width: 210,
                          child: Row(
                            children: const [
                              Text("0:05 / "),
                              Text("9:05"),
                            ],
                          ),
                        ),
                        Icon(Icons.crop_square_outlined)

                      ],
                    ),
                  ),

                ],
              ),
            )




          ],
        )
    );
  }
}
