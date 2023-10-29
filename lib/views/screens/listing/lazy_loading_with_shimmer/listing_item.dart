import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_shimmer_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';

class ListingItem extends StatelessWidget {
  final BookCard book;
  const ListingItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.getSize(160.0),
      margin: EdgeInsets.only(bottom: AppResponsive.getSize(10)),
      child: Row(
        children: [
          SizedBox(
            width: AppResponsive.getSize(120),
            child: SizedBox(
              height: AppResponsive.getSize(160),
              width: AppResponsive.size.width,
              child: ImageShimmerLoader(
                  url: book.imageUrl,
                  height: AppResponsive.getSize(160),
                  width: AppResponsive.getSize(120)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.getSize(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Text(
                      book.title,
                      style: TextStyle(
                        fontSize: AppResponsive.getSize(18),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai-Bold',
                      ),
                    ),
                  ),
                  Text(
                    book.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppResponsive.getSize(16),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: AppResponsive.getSize(14),
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
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
