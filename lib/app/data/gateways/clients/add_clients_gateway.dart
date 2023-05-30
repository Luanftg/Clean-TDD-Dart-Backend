part of data;

abstract class AddClientsGateway {
  Future<ClientEntity> call(ClientEntity clientEntity);
}
