import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/listing/lazy_loading_with_shimmer/listing_with_shimmer_loading.dart';

class ListingWithShimmerTab extends StatelessWidget {
  const ListingWithShimmerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListingWithShimmerLoading();
  }
}
