import 'package:kadosh_backend/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClientsHandler handler;
  late MockAddClientesUsecase mockAddClientesUsecase;

  setUpAll(() {
    mockAddClientesUsecase = MockAddClientesUsecase();
    handler = AddClientsHandler(addClientsUseCase: mockAddClientesUsecase);
  });
  group('AddClientHandler', () {
    test('should return a status created', () async {
      final result = await handler.call(RequestParams(body: {
        'name': 'name test',
        'email': 'email@email.com',
        'phone': '1234-1234'
      }));

      expect(result.status, StatusHandler.created);
    });

    test('should return a ClientOutputDTO', () async {
      final result = await handler.call(RequestParams(body: {
        'name': 'name test',
        'email': 'email@email.com',
        'phone_number': '1234-1234'
      }));

      expect(result.body, isA<ClientOutputDTO>());
    });
  });
}
