import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/controllers.dart';
import 'package:flutter_app/controllers/src/listing_controller.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/models/src/api_response.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListingProvider extends ChangeNotifier {
  // number of items call in each request
  final pageItemNumber = 10;

  RequestStatus? _state;
  RequestStatus? get state => _state;

  // true if there is next page in news list and false if not
  bool _nextPage = true;
  bool get nextPage => _nextPage;

  // will contain topics list
  List<Topic> _listing = [];
  List<Topic> get listing => _listing;

  // when news loading _loading = true else false
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  TopicSearch search = TopicSearch();

  Future<RequestStatus> getNews({bool reset = false}) async {
    if (_isLoading == true) return RequestStatus.informational;
    _isLoading = true;
    AppResponse _response =
        await ListingController.getNews(length: reset ? 0 : _listing.length, search: search);
    _state = _response.status;
    switch (_response.status) {
      case RequestStatus.success:
        if (reset) {
          _listing.clear();
        }
        _listing.addAll(_response.data as List<Topic>);
        _nextPage = _response.next;
        break;
      default:
        if (_listing.isEmpty || reset) break;
        Fluttertoast.showToast(
            msg: RequestStatusController.getStatusMessage(status: _response.status));
        break;
    }
    _isLoading = false;
    notifyListeners();
    return _response.status;
  }
}
