part of api;

class AddClientsHandler implements Handler {
  final AddClientsUseCase addClientsUseCase;

  AddClientsHandler({required this.addClientsUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final ClientEntity clientEntity =
          ClientInputDTO.toEntity(requestParams.body!);
      final ClientEntity clientCreated = await addClientsUseCase(clientEntity);
      return ResponseHandler(
        status: StatusHandler.created,
        body: ClientOutputDTO.toDTO(clientCreated),
      );
    } on AlreadyExistEmailException {
      return ResponseHandler(
        status: StatusHandler.badRequest,
        body: MessageError(message: 'Already exist a client with this email'),
      );
    } catch (e) {
      print(e.toString());
      return ResponseHandler(
        status: StatusHandler.internalServerError,
      );
    }
  }
}
