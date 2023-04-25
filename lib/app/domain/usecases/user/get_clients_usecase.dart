import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';

abstract class GetClientsUsecase {
  Future<List<ClientEntity>> call();
}
