part of api;

class ClientsController implements Controller {
  final GetClientsUsecase getClientsUsecase;
  final AddClientsUseCase addClientsUseCase;

  ClientsController(
      {required this.getClientsUsecase, required this.addClientsUseCase});

  @override
  String get route => '/clients';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientsHandler(getClientsUsecase: getClientsUsecase),
        'POST': AddClientsHandler(addClientsUseCase: addClientsUseCase),
      };
}
