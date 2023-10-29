import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/gallery_in_row.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/gallery_thumbnail.dart';

import 'package:flutter_app/views/styles/styles.dart';

class GalleryThree extends StatefulWidget {
  final double height;
  final List<String> urls;

  const GalleryThree({Key? key, required this.urls, this.height = 250.0}) : super(key: key);

  @override
  State<GalleryThree> createState() => _GalleryThreeState();
}

class _GalleryThreeState extends State<GalleryThree> {
  late double _itemWidth;
  late double _itemHeight;
  final ValueNotifier<int> _selectedUrl = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    _itemWidth = 110.0 * AppResponsive.scaleFactor;
    _itemHeight = 82.0 * AppResponsive.scaleFactor;
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
              child: ValueListenableBuilder<int>(
                  valueListenable: _selectedUrl,
                  builder: (context, value, _) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: SizedBox.expand(
                        key: ValueKey(_selectedUrl.value),
                        child: GalleryInRow(
                          url: widget.urls[_selectedUrl.value],
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: _itemHeight,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: widget.urls.length,
                itemExtent: _itemWidth,
                itemBuilder: (context, index) {
                  return GalleryThumbnail(
                    onPressed: () {
                      _selectedUrl.value = index;
                    },
                    url: widget.urls[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
