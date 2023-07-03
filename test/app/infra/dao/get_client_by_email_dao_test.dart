import 'dart:async';

import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:kadosh_backend/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../mock.dart';

void main() {
  late GetClientByEmailDAO getClientByEmailDAO;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    getClientByEmailDAO = GetClientByEmailDAO(mockConnection);
  });

  setUp(() {
    when(() => mockConnection.close())
        .thenAnswer((_) async => Completer<void>().complete());
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
    final result = await getClientByEmailDAO.call('email@email.com');
    expect(result, isA<ClientEntity>());
  });
}
