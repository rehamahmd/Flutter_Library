import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/galleries/gallery_1/image_widget.dart';
import 'package:flutter_app/views/screens/galleries/gallery_1/sound_cloud_widget.dart';
import 'package:flutter_app/views/screens/galleries/gallery_1/youtube_widget.dart';

import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/gallery_data.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _current = 0;
  List<GalleryModel> galleryList = [];
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    galleryList = GalleryData.getGalleryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppResponsive.size.width,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: AppResponsive.getSize(200),
                  width: AppResponsive.size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: galleryList
                        .map(
                          (GalleryModel item) => Container(
                            width: AppResponsive.size.width,
                            height: AppResponsive.getSize(200),
                            color: Colors.grey[300],
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                if (item.type == GalleryType.image)
                                  Center(child: ImageWidget(imageUrl: item.url!)),
                                if (item.type == GalleryType.youtubeVideo)
                                  Center(child: YoutubeVideo(initialKey: item.url!)),
                                if (item.type == GalleryType.soundCloud)
                                  Center(child: SoundCloudWidget(url: item.url!)),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                GallerSliderNumbersWidget(
                  currentIndex: _current,
                  galleryLength: galleryList.length,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: galleryList.asMap().entries.map((entry) {
                int index = galleryList.indexOf(entry.value);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = index;
                    });
                    _controller.animateToPage(entry.key);
                  },
                  child: GallerySliderIndicator(
                    indicatorIndex: index,
                    currentIndex: _current,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class GallerSliderNumbersWidget extends StatelessWidget {
  final int currentIndex;
  final int galleryLength;
  const GallerSliderNumbersWidget({Key? key, this.currentIndex = 0, required this.galleryLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        color: AppColors.grey,
        padding: const EdgeInsets.all(10),
        child: Text('${(currentIndex + 1).toString()}/${(galleryLength).toString()}',
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class GallerySliderIndicator extends StatelessWidget {
  final int indicatorIndex;
  final int currentIndex;
  const GallerySliderIndicator({
    Key? key,
    this.indicatorIndex = 0,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.getSize(5.0),
      height: AppResponsive.getSize(5.0),
      margin: EdgeInsets.symmetric(vertical: AppResponsive.getSize(15), horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == indicatorIndex
            ? const Color.fromRGBO(0, 0, 0, 0.9)
            : const Color.fromRGBO(0, 0, 0, 0.4),
      ),
    );
  }
}
