import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/content.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    super.key,
    required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;
  const _ContentHeaderMobile({
    super.key,
    required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // set the image in a container
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // apply the gradient
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),

        //set the movie title
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(
              featuredContent.titleImageUrl!,
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('added to list'),
              ),
              const _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('info'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;
  const _ContentHeaderDesktop({super.key, required this.featuredContent});

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoPlayerController;
  bool _isMute = false;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset(widget.featuredContent.videoUrl!)
          ..initialize().then((value) => setState(() {}))
          ..play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (_videoPlayerController.value.isPlaying)
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoPlayerController.value.isInitialized
                ? _videoPlayerController.value.aspectRatio
                : 2.334,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.featuredContent.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          AspectRatio(
            aspectRatio: _videoPlayerController.value.isInitialized
                ? _videoPlayerController.value.aspectRatio
                : 2.334,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.featuredContent.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Positioned(
            bottom: -1.0,
            left: 0.0,
            right: 0.0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.334,
              child: // apply the gradient
                  Container(
                height: 500.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.0,
            right: 50.0,
            bottom: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 8.0),
                          blurRadius: 6.0,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const _PlayButton(),
                    const SizedBox(
                      width: 15.0,
                    ),
                    ElevatedButton.icon(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0)),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () => print('More infos'),
                      icon: const Icon(Icons.info_outline, size: 30.0,),
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    if (_videoPlayerController.value.isInitialized)
                      IconButton(
                        color: Colors.white,
                        icon: _isMute
                            ? Icon(Icons.volume_off)
                            : Icon(Icons.volume_up),
                        onPressed: () => setState(() {
                          _isMute
                              ? _videoPlayerController.setVolume(100)
                              : _videoPlayerController.setVolume(0);
                          _isMute = _videoPlayerController.value.volume == 0;
                        }),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
          padding: !Responsive.isDesktop(context) ? const  MaterialStatePropertyAll(
              EdgeInsets.fromLTRB(20.0, 5.0, 25.0, 5.0)) : const MaterialStatePropertyAll(
              EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () => print('Play'),
        icon: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        label: const Text(
          "Play",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
