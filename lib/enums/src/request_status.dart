enum RequestStatus {
  exception, // request crashed - request time out or mobile exception
  informational, // 1xx - in process or continue checking
  success, // 2xx
  redirection, // 3xx
  clientError, // 4xx
  serverError // 5xx
}
