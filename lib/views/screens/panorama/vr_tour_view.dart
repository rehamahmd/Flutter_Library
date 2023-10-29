import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/controllers/src/images_cache_controller.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/failed_loading.dart';
import 'package:flutter_app/views/screens/panorama/panorame_view.dart';
import 'package:flutter_app/views/styles/styles.dart';
// import 'package:flutter_app/controllers/managers/images_cache_controller.dart';
// import 'package:flutter_app/view_models/vr/scene.dart';
// import 'package:flutter_app/view_models/vr/vr_tour.dart';
// import 'package:flutter_app/views/style/app_style.dart';
// import 'package:flutter_app/views/widgets/loaders/failed_loading.dart';
// import 'package:flutter_app/views/widgets/vr/panorama_view.dart';

class VrTourView extends StatefulWidget {
  final VrTour tour;

  const VrTourView({Key? key, required this.tour}) : super(key: key);

  @override
  _VrTourViewState createState() => _VrTourViewState();
}

class _VrTourViewState extends State<VrTourView> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.tour.scenesIdsMap[widget.tour.firstSceneId] ?? 0;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //ImagesCache.clearCache();
    //PaintingBinding.instance?.imageCache?.clear();
    //PaintingBinding.instance?.imageCache?.clearLiveImages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VrTourScene _currentScene = widget.tour.scenes[_currentIndex];

    return Stack(
      children: [
        FutureBuilder<Uint8List>(
            future: ImagesCache.load(_currentScene.image),
            builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
              Widget child;
              if (snapshot.connectionState == ConnectionState.waiting) {
                child = const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                child = Center(
                    child: FailedLoading(
                  message: "failed to load resources",
                  onReload: () {
                    setState(() {});
                  },
                ));
              } else {
                child = PanoramaView(
                  image: snapshot.data!,
                  scene: _currentScene,
                  onChange: (sceneId) {
                    _currentIndex = widget.tour.scenesIdsMap[sceneId]!;
                    setState(() {});
                  },
                );
              }
              //return Center(child: Image.memory(snapshot.data!));
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  switchOutCurve: Curves.easeInOut,
                  switchInCurve: Curves.easeInOut,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: Tween<double>(begin: 2.5, end: 1).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: child);
            }),
      ],
    );
  }
}
