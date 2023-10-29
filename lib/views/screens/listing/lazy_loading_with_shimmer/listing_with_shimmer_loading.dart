import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/listing/lazy_loading_with_shimmer/listing_item.dart';
import 'package:flutter_app/views/screens/listing/lazy_loading_with_shimmer/listing_item_shimmer.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/listing_data.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListingWithShimmerLoading extends StatefulWidget {
  const ListingWithShimmerLoading({Key? key}) : super(key: key);

  @override
  _ListingWithShimmerLoadingState createState() => _ListingWithShimmerLoadingState();
}

class _ListingWithShimmerLoadingState extends State<ListingWithShimmerLoading> {
  bool verticalLoading = false;
  List<BookCard> list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 5), () async {});
    setState(() {
      list += (ListingData.booksList);
      isLoading = false;
    });
  }

  _loadMore() async {
    setState(() {
      verticalLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () async {});
    setState(() {
      list += (ListingData.booksList);
      verticalLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 10),
        child: SizedBox(
          height: AppResponsive.size.height,
          child: Column(
            children: [
              Expanded(
                child: LazyLoadScrollView(
                    isLoading: verticalLoading,
                    onEndOfPage: _loadMore,
                    child: ListView.builder(
                        itemCount: isLoading ? 5 : list.length + 1,
                        itemBuilder: (context, index) {
                          if (isLoading) {
                            return const ListingItemShimmer();
                          } else {
                            if (index < list.length) {
                              return ListingItem(book: list[index]);
                            }
                            return verticalLoading
                                ? Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
