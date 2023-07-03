import 'dart:async';

import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:kadosh_backend/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClientDAO addClientDAO;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    addClientDAO = AddClientDAO(connection: mockConnection);
  });

  setUp(() {
    when(() => mockConnection.close())
        .thenAnswer((_) async => Completer().complete());
  });
  test('should return a client', () async {
    when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
          {
            'id': 1,
            'name': 'name',
            'email': 'email@email.com',
            'phone_number': '1234-1234',
            'photo_url': 'https://myfoto',
          }
        ]);
    final result = await addClientDAO.call(clientMock);
    expect(result, isA<ClientEntity>());
  });
}
