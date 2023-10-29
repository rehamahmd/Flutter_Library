import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/loaders/shimmer_loading.dart';
import 'package:flutter_app/views/styles/styles.dart';

class ListingItemShimmer extends StatelessWidget {
  const ListingItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.getSize(160.0),
      margin: EdgeInsets.only(bottom: AppResponsive.getSize(10)),
      child: Row(
        children: [
          SizedBox(
            width: AppResponsive.getSize(120),
            child: ShimmerWidget.rectangular(
              height: AppResponsive.getSize(160.0),
              width: AppResponsive.getSize(120),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: AppResponsive.getSize(15.0),
                    width: AppResponsive.getSize(80.0),
                  ),
                  SizedBox(height: AppResponsive.getSize(5)),
                  ShimmerWidget.rectangular(
                    height: AppResponsive.getSize(20.0),
                    width: AppResponsive.getSize(210.0),
                  ),
                  SizedBox(height: AppResponsive.getSize(5)),
                  ShimmerWidget.rectangular(
                    height: AppResponsive.getSize(20.0),
                    width: AppResponsive.getSize(210.0),
                  ),
                  SizedBox(height: AppResponsive.getSize(5)),
                  ShimmerWidget.rectangular(
                    height: AppResponsive.getSize(20.0),
                    width: AppResponsive.getSize(210.0),
                  ),
                  SizedBox(height: AppResponsive.getSize(5)),
                  ShimmerWidget.rectangular(
                    height: AppResponsive.getSize(12.0),
                    width: AppResponsive.getSize(120.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
