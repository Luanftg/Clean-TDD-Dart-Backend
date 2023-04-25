import 'package:kadosh_backend/app/api/api.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

late GetClientsHandler getClientsHandler;
late MockGetClientsUsecase mockGetClientsUsecase;
void main() {
  setUpAll(() async {
    mockGetClientsUsecase = MockGetClientsUsecase();
    getClientsHandler =
        GetClientsHandler(getClientsUsecase: mockGetClientsUsecase);
  });

  group('GetClientsHanlder', () {
    test('deve retornar uma instancia de ResponseHandler ', () async {
      when(() => mockGetClientsUsecase.call()).thenAnswer((_) async => []);
      final result = await getClientsHandler.call();
      expect(result, isA<ResponseHandler>());
    });

    test('deve retornar uma status ok', () async {
      when(() => mockGetClientsUsecase.call()).thenAnswer((_) async => []);
      final result = await getClientsHandler.call();
      expect(result.status, StatusHandler.ok);
    });
    test('deve retornar uma lista de ClientOutputDTO', () async {
      when(() => mockGetClientsUsecase.call()).thenAnswer((_) async => [
            ClientEntity(
                id: 1,
                name: 'name',
                email: 'email',
                phoneNumber: '12-99721-3383')
          ]);
      final result = await getClientsHandler.call();
      expect(result.body, isA<List<ClientOutputDTO>>());
    });
  });
}
