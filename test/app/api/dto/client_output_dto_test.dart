import 'package:kadosh_backend/app/api/api.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:kadosh_backend/app/domain/usecases/user/get_clients_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../mock.dart';

late MockGetClientsUsecase mockGetClientsUsecase;
late GetClientsUsecase getClientsUsecase;

void main() {
  setUpAll(() async {
    mockGetClientsUsecase = MockGetClientsUsecase();
  });
  test('deve retornar uma lista de ClientOutputDTO', () async {
    when(() => mockGetClientsUsecase.call())
        .thenAnswer((_) async => <ClientEntity>[]);
    final clients = await getClientsUsecase.call();
    final result = ClientOutputDTO.toCollectionDTO(clients);
    expect(result, isA<List<ClientOutputDTO>>());
  });
}
