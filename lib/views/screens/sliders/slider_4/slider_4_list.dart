import 'dart:ui';

import 'package:flutter/material.dart';

class SliderFourList extends StatefulWidget {
  const SliderFourList({
    Key? key,
    required this.children,
    required this.itemExtent,
    this.initialIndex = 0,
    this.padding = const EdgeInsets.all(0),
    this.backItemsShadowColor = Colors.transparent,
    this.enableBackItemsShadow = false,
  }) : super(key: key);

  final List<Widget> children;
  final int initialIndex;
  final double itemExtent;
  final EdgeInsetsGeometry padding;
  final Color backItemsShadowColor;
  final bool enableBackItemsShadow;

  @override
  _SliderFourListState createState() => _SliderFourListState();
}

class _SliderFourListState extends State<SliderFourList> {
  PageController? _pageController;
  int? _currentIndex;
  double? _pagePercent;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    _pageController = PageController(viewportFraction: .85, initialPage: _currentIndex!);
    _pagePercent = 0.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController!.page!.floor();
    _pagePercent = (_currentIndex! - _pageController!.page!).clamp(-2.0, 2.0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final width = constraints.maxWidth;
      return Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Transform.scale(
                  scale: .8,
                  child: _Switcher(
                    itemExtent: widget.itemExtent,
                    currentItem: _currentIndex! - 1 < 0
                        ? Material(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          )
                        : widget.children[_currentIndex! - 1],
                    switchItem: _currentIndex! - 1 < 0
                        ? widget.children[_currentIndex!]
                        : _pagePercent! < -1.0
                            ? widget.children[_currentIndex! - 2]
                            : widget.children[_currentIndex!],
                    switchOpacity: _pagePercent!.abs(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.scale(
                  scale: .8,
                  child: _Switcher(
                    itemExtent: widget.itemExtent,
                    currentItem: _currentIndex! + 1 < widget.children.length
                        ? widget.children[_currentIndex! + 1]
                        : SizedBox.shrink(),
                    switchItem: _currentIndex! + 2 >= widget.children.length
                        ? SizedBox.shrink()
                        : _pagePercent! < 1.0
                            ? widget.children[_currentIndex! + 2]
                            : widget.children[_currentIndex!],
                    switchOpacity: _pagePercent!.abs(),
                  ),
                ),
              ),
              Center(
                child: _Switcher(
                  itemExtent: widget.itemExtent,
                  currentItem: widget.children[_currentIndex!],
                  switchItem: !_pagePercent!.isNegative
                      ? _currentIndex! - 1 < 0
                          ? SizedBox.shrink()
                          : widget.children[_currentIndex! - 1]
                      : _currentIndex! + 1 < widget.children.length
                          ? widget.children[_currentIndex! + 1]
                          : SizedBox.shrink(),
                  switchOpacity: _pagePercent!.abs(),
                ),
              ),
            ],
          ),

          //---------------------------------------
          // Back Items Shadow
          //---------------------------------------
          if (widget.enableBackItemsShadow)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.backItemsShadowColor.withOpacity(.8),
                      widget.backItemsShadowColor.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),

          //---------------------------------------
          // Void Page View
          //---------------------------------------
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return const SizedBox();
            },
          ),
        ],
      );
    });
  }
}

class _Switcher extends StatelessWidget {
  final double itemExtent;
  final Widget currentItem;
  final Widget switchItem;
  final double? switchOpacity;

  const _Switcher(
      {Key? key,
      required this.itemExtent,
      required this.currentItem,
      required this.switchItem,
      required this.switchOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemExtent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          switchItem,
          Opacity(opacity: switchOpacity!.floor() + 1 - switchOpacity!, child: currentItem),
        ],
      ),
    );
  }
}
