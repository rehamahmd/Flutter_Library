import 'package:flutter_app/enums/enums.dart';

class RequestStatusController {
  static String getStatusMessage({
    required RequestStatus? status,
    String? failedMessage,
    String? successMessage,
  }) {
    switch (status) {
      case RequestStatus.exception:
        // request crashed - request time out or mobile exception
        // may be cause by backend or frontend
        return "Currently service not available or has issue please try again later";
      case RequestStatus.informational:
        // client's request in process
        return "Wait until your request complete";
      case RequestStatus.success:
        // client's request was successfully received
        return successMessage ?? "Request complete successfully";
      case RequestStatus.clientError:
        // client's request have error
        return failedMessage ?? "Failed to complete request";
      case RequestStatus.serverError:
        // server have error
        return "Currently service not available";
      default:
        // no error match so return default error
        return "Exception, failed to complete request";
    }
  }

  static RequestStatus convertStatusToEnum(int status) {
    if (status >= 100 && status < 200) {
      return RequestStatus.informational;
    } else if (status >= 200 && status < 300) {
      return RequestStatus.success;
    } else if (status >= 300 && status < 400) {
      return RequestStatus.redirection;
    } else if (status >= 400 && status < 500) {
      return RequestStatus.clientError;
    } else if (status >= 500) {
      return RequestStatus.clientError;
    } else {
      return RequestStatus.exception;
    }
  }
}
