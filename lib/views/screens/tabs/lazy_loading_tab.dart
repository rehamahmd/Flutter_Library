import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/listing/lazy_lodaing_listng.dart';

class LazyLoadingTab extends StatelessWidget {
  const LazyLoadingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LazyLoadingListing();
  }
}
