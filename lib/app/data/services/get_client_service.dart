part of data;

class GetClientService implements GetClientsUsecase {
  final GetClientsGateway getClientsGateway;

  GetClientService({required this.getClientsGateway});
  @override
  Future<List<ClientEntity>> call() async {
    return await getClientsGateway();
  }
}
