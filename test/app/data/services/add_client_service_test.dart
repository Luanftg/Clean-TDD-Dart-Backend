import 'package:kadosh_backend/app/data/data.dart';
import 'package:kadosh_backend/app/domain/domain.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../mock.dart';

class FakeClient extends Fake implements ClientEntity {}

void main() {
  late AddClientService addClientService;
  late MockAddClientsGateteway mockAddClientesGateway;
  late MockGetClientByEmail mockGetClientByEmail;

  setUpAll(() {
    mockGetClientByEmail = MockGetClientByEmail();
    mockAddClientesGateway = MockAddClientsGateteway();
    addClientService = AddClientService(
        addClientsGateway: mockAddClientesGateway,
        getClientByEmail: mockGetClientByEmail);
    registerFallbackValue(FakeClient());
  });

  group('AddClientService', () {
    test('Should addd a client', () async {
      when(() => mockAddClientesGateway.call(any())).thenAnswer(
        (_) async => clientMock,
      );
      when(() => mockGetClientByEmail.call(any())).thenAnswer(
        (_) async => null,
      );
      final client = ClientEntity(id: 0, name: 'name', email: 'email');
      final result = await addClientService.call(client);
      expect(result, isA<ClientEntity>());
    });
    test(
        'Should throw an Exception when try to register a client with an already used email',
        () async {
      when(() => mockGetClientByEmail.call(any())).thenAnswer(
        (_) async => clientMock,
      );
      final client = ClientEntity(id: 0, name: 'name', email: 'email');

      expect(() => addClientService.call(client),
          throwsA(isA<AlreadyExistEmailException>()));
    });
  });
}
