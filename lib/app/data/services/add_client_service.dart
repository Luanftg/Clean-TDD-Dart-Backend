part of data;

class AddClientService implements AddClientsUseCase {
  final AddClientsGateway addClientsGateway;
  final GetClientByEmailGateway getClientByEmail;

  AddClientService({
    required this.addClientsGateway,
    required this.getClientByEmail,
  });
  @override
  Future<ClientEntity> call(ClientEntity clientEntity) async {
    final clientWithEmailAlreadyExist =
        await getClientByEmail(clientEntity.email);
    if (clientWithEmailAlreadyExist != null) {
      throw AlreadyExistEmailException();
    }
    return await addClientsGateway(clientEntity);
  }
}
