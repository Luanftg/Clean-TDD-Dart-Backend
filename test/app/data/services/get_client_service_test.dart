import 'package:kadosh_backend/app/data/data.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../../mock.dart';

void main() {
  late MockGetClientsGateway mockGetClientsGateway;
  late GetClientService getClientService;

  setUpAll(() {
    mockGetClientsGateway = MockGetClientsGateway();
    getClientService =
        GetClientService(getClientsGateway: mockGetClientsGateway);
  });

  group('GetClientsService:', () {
    test('deve retornar uma lista de clientsEntity', () async {
      when(() => mockGetClientsGateway.call())
          .thenAnswer((_) async => [clientMock]);
      final result = await getClientService.call();
      expect(result, isA<List<ClientEntity>>());
    });
  });
}
