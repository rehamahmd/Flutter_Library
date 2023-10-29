import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderFive extends StatefulWidget {
  const SliderFive({Key? key}) : super(key: key);

  @override
  _SliderFiveState createState() => _SliderFiveState();
}

class _SliderFiveState extends State<SliderFive> {
  int _currentMainIndex = 0;
  int mainSlidersLength = 6;
  List<SliderModel> mainSlider = [];
  List<SliderModel> innerSlider = [];
  List<SliderModel> allInnerSlidersList = [];
  @override
  void initState() {
    super.initState();
    _generateMainSlidersList();
    _generateInnerSlidersList();
    _setInnerSliders(1);
  }

  void _generateMainSlidersList() {
    if (mainSlider.isEmpty) {
      mainSlider = SlidersData.generateRandomSlidersList(mainSlidersLength, []);
    }
  }

  void _generateInnerSlidersList() {
    allInnerSlidersList = SlidersData.generateRandomChildSlidersForParent(mainSlidersLength, []);
  }

  void _setInnerSliders(id) {
    innerSlider = allInnerSlidersList.where((e) => e.parentId == id).toList();
  }

  @override
  Widget build(BuildContext context) {
    double sliderHeight = AppResponsive.size.height - 180;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// ******************* ///
                /// *** MAiN SLIDERS *** //
                /// ******************* ///
                SizedBox(
                  height: sliderHeight,
                  child: PageView.builder(
                    itemCount: mainSlider.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            height: sliderHeight - 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade300,
                            ),
                            child: Image.network(
                              mainSlider[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentMainIndex = index;
                      });
                      _setInnerSliders(mainSlider[index].id);
                    },
                  ),
                ),

                /// ******************* ///
                /// *** INNER SLIDERS *** //
                /// ******************* ///

                Positioned(
                  bottom: 100.0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: AppResponsive.getSize(160),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: innerSlider.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          width: (AppResponsive.size.width / 2) - 30,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            child: ImageLoader(
                              url: innerSlider[index].image,
                              boxFit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            /// ******************* ///
            // *** INDICATEORS  ***//
            /// ******************* ///
            const SizedBox(height: 20),
            SmoothPageIndicator(
              controller: PageController(initialPage: _currentMainIndex),
              count: mainSlider.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                type: WormType.thin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
