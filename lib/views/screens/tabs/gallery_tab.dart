import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/3D/3D_model_viewer/3D_model_viewer_screen.dart';
import 'package:flutter_app/views/screens/3D/ar_3d_model/ar_3d_model_view.dart';
import 'package:flutter_app/views/screens/galleries/gallery_1/gallery_1.dart';
import 'package:flutter_app/views/screens/galleries/gallery_2/gallery_2.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/gallery_3.dart';
import 'package:flutter_app/views/screens/giga_pexel/giga_pexel_screen.dart';
import 'package:flutter_app/views/screens/panorama/panorama_screen.dart';
import 'package:flutter_app/views/screens/turntable/turntable_screen.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/gallery_data.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
              height: AppResponsive.scaleFactor * 260,
              child: Stack(
                children: [
                  GalleryScreen(),
                  Container(
                    height: 40,
                    width: 40,
                    color: AppColors.orange.withOpacity(.5),
                    child: const Center(
                      child: Text(
                        'G 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
          const AR3DModelView(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const A3DModelViewerScreen()));
              },
              child: const Text("3D Model Viewer")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const PanoramaScreen()));
              },
              child: const Text("Panorama 360")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => TurnTableScreen()));
              },
              child: const Text("Turntable")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const GigaPixelScreen()));
              },
              child: const Text("Giga Pixel")),
          SizedBox(height: AppResponsive.scaleFactor * 10),
          Stack(
            children: [
              GalleryTwo(
                viewFraction: .9,
                urls: GalleryData.galleryLinks,
                height: AppResponsive.scaleFactor * 220,
              ),
              Container(
                height: 40,
                width: 40,
                color: AppColors.orange.withOpacity(.5),
                child: const Center(
                  child: Text(
                    'G 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              GalleryThree(
                height: AppResponsive.scaleFactor * 260,
                urls: GalleryData.galleryLinks,
              ),
              Container(
                height: 40,
                width: 40,
                color: AppColors.orange.withOpacity(.5),
                child: const Center(
                  child: Text(
                    'G 3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppResponsive.scaleFactor * 10),
        ],
      ),
    );
  }
}
