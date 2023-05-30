part of api;

class AddClientsHandler implements Handler {
  final AddClientsUseCase addClientsUseCase;

  AddClientsHandler({required this.addClientsUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    return ResponseHandler(
        status: StatusHandler.created,
        body: ClientOutputDTO(
            email: 'email@email.com',
            id: 1,
            name: 'name test',
            phoneNumber: '1234-1234'));
  }
}
