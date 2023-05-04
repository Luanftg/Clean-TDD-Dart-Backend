part of api;

class AddClientsHandler implements Handler {
  final AddClientsUseCase addClientsUseCase;

  AddClientsHandler({required this.addClientsUseCase});
  @override
  Future<ResponseHandler> call() {
    throw UnimplementedError();
  }
}
