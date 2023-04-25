part of api;

abstract class Handler {
  Future<ResponseHandler> call();
}

class ResponseHandler {
  final StatusHandler status;
  final Object? body;

  ResponseHandler({this.body, required this.status});
}

enum StatusHandler {
  ok,
}
