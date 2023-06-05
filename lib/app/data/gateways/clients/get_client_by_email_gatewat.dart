part of data;

abstract class GetClientByEmailGateway {
  Future<ClientEntity?> call(String email);
}
