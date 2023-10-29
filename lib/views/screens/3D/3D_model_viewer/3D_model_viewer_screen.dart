import 'package:flutter/material.dart';
import 'package:flutter_app/providers/src/scratch_notifier.dart';
import 'package:flutter_app/views/screens/3D/3D_model_viewer/3D_indicator_widget.dart';
import 'package:flutter_app/views/screens/3D/3D_model_viewer/3D_viewer_details.dart';
import 'package:flutter_app/views/styles/src/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:scratcher/scratcher.dart';

class A3DModelViewerScreen extends StatefulWidget {
  const A3DModelViewerScreen({Key? key}) : super(key: key);

  @override
  _A3DModelViewerScreenState createState() => _A3DModelViewerScreenState();
}

class _A3DModelViewerScreenState extends State<A3DModelViewerScreen>
    with SingleTickerProviderStateMixin {
  Size get _size => MediaQuery.of(context).size;
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _scrollIndicatorAnimation;
  int _currentIndex = 1;
  double _scrollPercentage = 0.0;
  double scrollTotalHeight = 0.0;
  final List<String> animalNames = [
    'Panda',
    'Sloth',
    'Cat',
    'Tortoise',
    'Elephant',
    'Fox',
    'Dolphin',
    'Reindeer',
  ];
  final ScratchNotifier _scratchNotifier = ScratchNotifier();

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_listener);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600))..forward();
    _scrollIndicatorAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    super.initState();
  }

  void _listener() {
    final double _maxScrollExtent = _scrollController.position.maxScrollExtent;
    final double _position =
        _scrollController.position.pixels.isNegative ? 0.0 : _scrollController.position.pixels;
    _scrollPercentage = _position / _maxScrollExtent;
    final double scolledHeight = _scrollPercentage * scrollTotalHeight;
    final double heightOfBox = scrollTotalHeight / animalNames.length;
    final int _stoppedIndex =
        (scolledHeight / heightOfBox).ceil().clamp(1, animalNames.length).toInt();
    _currentIndex = _stoppedIndex;
    // Scroll activity lookup
    _scrollController.position.isScrollingNotifier.addListener(() {
      final bool _isScrolling = _scrollController.position.isScrollingNotifier.value;
      if (!_isScrolling) {
        _animationController.forward();
      }
    });

    if (_scrollController.position.activity is BallisticScrollActivity) {
      _animationController.reverse();
    }
    setState(() {});
  }

  _onChange(Size size) {
    scrollTotalHeight = size.height - topMargin - bottomMargin;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double kContainerConstraints = _size.height * 0.3;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0.0, automaticallyImplyLeading: true),
        // backgroundColor: Colors.white,
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            A3DIndicatorWidget(
              scrollController: _scrollController,
              currentIndex: _currentIndex,
              scrollPercentage: _scrollPercentage,
              scrollTotalHeight: scrollTotalHeight,
              scrollIndicatorAnimation: _scrollIndicatorAnimation,
              onChange: _onChange,
            ),
            const SizedBox(width: 10),
            _cardList(kContainerConstraints),
            const SizedBox(width: 10),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _onScratchEnd(e) async {
    _scratchNotifier.addToScrated(e);
    await Future.delayed(const Duration(milliseconds: 1800));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => A3DViewerDetails(model: e.toLowerCase())),
    );
  }

  Widget _cardList(double kContainerConstraints) => SizedBox(
        height: _size.height,
        width: _size.width * 0.8,
        child: AnimatedList(
          shrinkWrap: true,
          initialItemCount: animalNames.length,
          controller: _scrollController,
          itemBuilder: (context, index, animation) {
            final String e = animalNames[index];
            return ValueListenableBuilder(
                valueListenable: _scratchNotifier,
                builder: (BuildContext? ctx, _, Widget? child) {
                  return AnimatedContainer(
                    height: kContainerConstraints,
                    alignment: Alignment.center,
                    width: kContainerConstraints,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: !_scratchNotifier.isContains(e)
                          ? Colors.black.withOpacity(0.03)
                          : AppColors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Scratcher(
                            onScratchEnd: () async {
                              await _onScratchEnd(e);
                            },
                            accuracy: ScratchAccuracy.low,
                            color: Colors.transparent,
                            image: Image.asset(
                              _scratchNotifier.isContains(e)
                                  ? 'assets/3D/${e.toLowerCase()}.png'
                                  : 'assets/3D/${e.toLowerCase()}_initial.png',
                            ),
                            child: Image.asset('assets/3D/${e.toLowerCase()}.png')),
                        AnimatedCrossFade(
                          alignment: Alignment.center,
                          firstChild: Lottie.asset('assets/3D/clapping.json',
                              frameRate: FrameRate.max,
                              width: kContainerConstraints,
                              fit: BoxFit.cover,
                              repeat: false,
                              alignment: Alignment.bottomCenter),
                          secondChild: const SizedBox.shrink(),
                          crossFadeState: _scratchNotifier.isContains(e)
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                        )
                      ],
                    ),
                  );
                });
          },
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 40),
        ),
      );
}
