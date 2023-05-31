import 'package:kadosh_backend/app/api/api.dart';
import 'package:kadosh_backend/app/domain/domain.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClientsHandler handler;
  late MockAddClientesUsecase mockAddClientesUsecase;

  setUpAll(() {
    mockAddClientesUsecase = MockAddClientesUsecase();
    handler = AddClientsHandler(addClientsUseCase: mockAddClientesUsecase);
    registerFallbackValue(
      ClientEntity(
        id: 1,
        name: 'name test',
        email: 'email@email.com',
        phoneNumber: '1234-1234',
      ),
    );
  });
  group('AddClientHandler', () {
    test('should return a status created', () async {
      when(() => mockAddClientesUsecase.call(any()))
          .thenAnswer((_) async => ClientEntity(
                id: 1,
                name: 'name test',
                email: 'email@email.com',
                phoneNumber: '1234-1234',
              ));
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

    test(
        'should return a status InternalServerError when a generic error happens',
        () async {
      when(() => mockAddClientesUsecase.call(any())).thenThrow(Exception());
      final result = await handler.call(RequestParams(body: {
        'name': 'name test',
        'email': 'email@email.com',
        'phone_number': '1234-1234'
      }));

      expect(result.status, StatusHandler.internalServerError);
    });

    test('should return a message "Already exist a client with this email"',
        () async {
      when(() => mockAddClientesUsecase.call(any()))
          .thenThrow(AlreadyExistEmailException());
      final result = await handler.call(RequestParams(body: {
        'name': 'name test',
        'email': 'email@email.com',
        'phone_number': '1234-1234'
      }));

      expect((result.body as MessageError).message,
          'Already exist a client with this email');
    });

    test('should return a status "badRequest" when already have an email saved',
        () async {
      when(() => mockAddClientesUsecase.call(any()))
          .thenThrow(AlreadyExistEmailException());
      final result = await handler.call(RequestParams(body: {
        'name': 'name test',
        'email': 'email@email.com',
        'phone_number': '1234-1234'
      }));

      expect(result.status, StatusHandler.badRequest);
    });
  });
}
