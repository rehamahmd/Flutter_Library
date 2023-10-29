import 'package:flutter/material.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/styles/styles.dart';

class HotspotButton extends StatefulWidget {
  final VoidCallback onPressed;
  final SceneHotspot hotspot;

  const HotspotButton({Key? key, required this.onPressed, required this.hotspot}) : super(key: key);

  @override
  State<HotspotButton> createState() => _HotspotButtonState();
}

class _HotspotButtonState extends State<HotspotButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  _onPressed() {
    switch (widget.hotspot.type) {
      case HotspotTypes.info:
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        break;
      case HotspotTypes.scene:
        widget.onPressed();
        break;
    }
  }

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    final Animation<double> curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = Tween(begin: 0.0, end: 1.0).animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: _animation,
            child: Opacity(
              opacity: _animation.value,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8 * AppResponsive.scaleFactor),
                    primary: Colors.white,
                    backgroundColor: Colors.black38,
                    textStyle: Theme.of(context).textTheme.caption),
                onPressed: widget.onPressed,
                child: Text(widget.hotspot.label ?? ""),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, _animation.value),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(2),
              primary: Colors.white,
              shape: const CircleBorder(),
              backgroundColor: Colors.black38,
            ),
            onPressed: _onPressed,
            child: Icon(
              widget.hotspot.type == HotspotTypes.scene
                  ? Icons.arrow_circle_up_outlined
                  : Icons.info_outline,
              size: 24 * AppResponsive.scaleFactor,
            ),
          ),
        ),
      ],
    );
  }
}
