part of api;

abstract class Handler {
  Future<ResponseHandler> call(RequestParams requestParams);
}

class RequestParams {
  final Map<String, dynamic>? body;

  RequestParams({this.body});
}

class ResponseHandler {
  final StatusHandler status;
  final Object? body;

  ResponseHandler({this.body, required this.status});
}

enum StatusHandler { ok, created, internalServerError, badRequest }
