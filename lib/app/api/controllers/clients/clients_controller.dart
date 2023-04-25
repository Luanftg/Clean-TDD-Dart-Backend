part of api;

class ClientsController implements Controller {
  final GetClientsUsecase getClientsUsecase;

  ClientsController({required this.getClientsUsecase});

  @override
  String get route => '/clients';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientsHandler(getClientsUsecase: getClientsUsecase),
      };
}
