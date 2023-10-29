import 'package:flutter_app/controllers/controllers.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/src/api_response.dart';
import 'package:http/http.dart';

class ListingApi {
  ListingApi._();

  static Future<AppResponse<String>> getNews({
    required Uri url,
  }) async {
    try {
      Response _response = await get(url);
      return AppResponse(
          data: _response.body,
          status: RequestStatusController.convertStatusToEnum(_response.statusCode));
    } catch (error) {
      return AppResponse(status: RequestStatus.exception, data: error.toString());
    }
  }
}
