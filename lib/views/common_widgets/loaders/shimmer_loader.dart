import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();
  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: AppColors.orange.withOpacity(.08),
        highlightColor: AppColors.orange.withOpacity(.2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400],
            shape: shapeBorder,
          ),
        ),
      );
}
