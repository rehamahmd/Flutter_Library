import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class A3DViewerDetails extends StatefulWidget {
  const A3DViewerDetails({Key? key, required this.model}) : super(key: key);
  final String model;

  @override
  _A3DViewerDetailsState createState() => _A3DViewerDetailsState();
}

class _A3DViewerDetailsState extends State<A3DViewerDetails> {
  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigateBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                _ModelWidget(src: widget.model.toLowerCase()),
                _BackButton(
                  navigateBack: _navigateBack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback navigateBack;

  const _BackButton({Key? key, required this.navigateBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 20,
      child: InkWell(
        onTap: navigateBack,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.orange.withOpacity(0.1)),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black.withOpacity(0.75),
            size: 16,
          ),
        ),
      ),
    );
  }
}

class _ModelWidget extends StatelessWidget {
  final String src;
  const _ModelWidget({
    Key? key,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      src: 'assets/3D/$src.glb',
      autoPlay: true,
      autoRotate: true,
      autoRotateDelay: 1,
      cameraControls: true,
      ar: true,
    );
  }
}
