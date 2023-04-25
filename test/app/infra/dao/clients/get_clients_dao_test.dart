import 'dart:async';

import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';
import 'package:kadosh_backend/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late MockConnection mockConnection;
  late GetCLientsDAO getCLientsDAO;

  setUpAll(() {
    mockConnection = MockConnection();
    getCLientsDAO = GetCLientsDAO(connection: mockConnection);
  });
  test('deve retornar uma lista de clientsEntity', () async {
    when(() => mockConnection.query(any())).thenAnswer((_) async => [
          {
            'id': 1,
            'name': 'name',
            'email': 'email@email.com',
            'phone_number': '12-99721-8878',
            'photo_url': 'http://minhafoto.com.br',
            'is_authenticated': false,
            'password': 'password123'
          }
        ]);
    when(() => mockConnection.close())
        .thenAnswer((_) async => Completer<void>().complete());
    final result = await getCLientsDAO();
    expect(result, isA<List<ClientEntity>>());
  });
}
