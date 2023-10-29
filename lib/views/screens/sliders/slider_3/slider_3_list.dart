import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_3/slider_3_list_item.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderThreeList extends StatefulWidget {
  final List<SliderModel> sliders;
  const SliderThreeList({Key? key, required this.sliders}) : super(key: key);

  @override
  _SliderThreeListState createState() => _SliderThreeListState();
}

class _SliderThreeListState extends State<SliderThreeList> {
  late final PageController pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      viewportFraction: 0.95,
      keepPage: true,
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _moveNext() {
    if (_currentIndex < widget.sliders.length - 1) {
      setState(() {
        _currentIndex += 1;
      });
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _movePrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex -= 1;
      });
      pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: AppResponsive.getSize(20)),
            SizedBox(
              height: AppResponsive.getSize(500),
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SliderThreeListItem(
                      cardWidth: AppResponsive.size.width,
                      sliderModel: widget.sliders[index],
                      borderRadius: 30,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: AppResponsive.getSize(20)),
            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: AppResponsive.getSize(20)),
                IconButton(
                  onPressed: _movePrevious,
                  icon: const Icon(Icons.arrow_back),
                  color: _currentIndex > 0 ? Colors.black : Colors.grey,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: widget.sliders.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    radius: 3,
                    spacing: 10,
                    dotHeight: 6,
                    dotWidth: 9,
                    dotColor: Colors.black,
                    activeDotColor: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: _moveNext,
                  icon: const Icon(Icons.arrow_forward),
                  color: _currentIndex < (widget.sliders.length - 1) ? Colors.black : Colors.grey,
                ),
                SizedBox(width: AppResponsive.getSize(20)),
              ],
            )
          ]),
    );
  }
}
