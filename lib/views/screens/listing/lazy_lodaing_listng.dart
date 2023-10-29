import 'package:flutter/material.dart';
import 'package:flutter_app/providers/src/listing_provider.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/common_widgets/listing/list_widget.dart';
import 'package:flutter_app/views/common_widgets/loaders/loading_manager.dart';

import 'package:provider/provider.dart';

class LazyLoadingListing extends StatefulWidget {
  static final String id = "/news-screen";
  const LazyLoadingListing({Key? key}) : super(key: key);

  @override
  _LazyLoadingListingState createState() => _LazyLoadingListingState();
}

class _LazyLoadingListingState extends State<LazyLoadingListing>
    with AutomaticKeepAliveClientMixin {
  late ListingProvider _listingProvider;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _listingProvider = Provider.of<ListingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: LoadingManager(
          isLoading: _listingProvider.isLoading,
          status: _listingProvider.state,
          onRefresh: () async {
            await _listingProvider.getNews(reset: true);
          },
          child: Column(
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Items: ${_listingProvider.listing.length}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox.shrink()
                ],
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListWidget(
                  nextPage: _listingProvider.nextPage,
                  onLazyLoad: () async {
                    await _listingProvider.getNews();
                  },
                  topics: _listingProvider.listing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
