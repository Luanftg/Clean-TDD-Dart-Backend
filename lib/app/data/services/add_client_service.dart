part of data;

class AddClientService implements AddClientsUseCase {
  final AddClientsGateway addClientsGateway;

  AddClientService({required this.addClientsGateway});
  @override
  Future<ClientEntity> call(ClientEntity clientEntity) async {
    return await addClientsGateway(clientEntity);
  }
}
