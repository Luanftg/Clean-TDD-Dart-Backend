part of '../server.dart';

Middleware contentJSON() {
  return createMiddleware(
      responseHandler: (Response response) =>
          response.change(headers: {'content-type': 'application/json'}));
}
