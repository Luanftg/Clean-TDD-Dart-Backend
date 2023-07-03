part of '../server.dart';

class ShelfAdapter {
  List<Controller> controllers;

  ShelfAdapter({required this.controllers});

  void handler(Router router) {
    for (final controller in controllers) {
      _handler(controller, router);
    }
  }

  void _handler(Controller controller, Router router) {
    final String route = controller.route;
    final handlers = controller.handlers;

    for (final entry in handlers.entries) {
      final String verb = entry.key;

      router.add(verb, route, (Request request) async {
        final payload = await request.readAsString();
        final responseHandler = await entry.value(RequestParams(
          body: payload.isEmpty ? null : jsonDecode(payload),
        ));
        switch (responseHandler.status) {
          case StatusHandler.ok:
            return ResponseJSON.ok(responseHandler.body);
          case StatusHandler.created:
            return ResponseJSON.created(responseHandler.body);
          case StatusHandler.badRequest:
            return ResponseJSON.badRequest(responseHandler.body);
          default:
            return Response.internalServerError();
        }
      });
    }
  }
}
