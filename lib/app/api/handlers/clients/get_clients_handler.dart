part of api;

class GetClientsHandler implements Handler {
  final GetClientsUsecase getClientsUsecase;
  GetClientsHandler({required this.getClientsUsecase});

  @override
  Future<ResponseHandler> call() async {
    final List<ClientEntity> clients = await getClientsUsecase();
    return ResponseHandler(
        status: StatusHandler.ok,
        body: ClientOutputDTO.toCollectionDTO(clients));
  }
}
