import 'package:kadosh_backend/app/api/api.dart';
import 'package:kadosh_backend/app/domain/usecases/user/get_clients_usecase.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

///Controllers
///
/// route: /clients => clientsController
/// metodos: GET, POST ...
/// Handlers: ações para as requisições
///
/// key: valor
/// GET: lista de clients = handler
/// GET/{clientId}: pesquisa de um client
/// PUT/{clientId}: atualiza um client

void main() {
  late ClientsController clientsController;
  late GetClientsUsecase mockGetClientsUsecase;
  setUpAll(() {
    mockGetClientsUsecase = MockGetClientsUsecase();
    clientsController =
        ClientsController(getClientsUsecase: mockGetClientsUsecase);
  });

  group('Clients Controller', () {
    test('clients controller deve conter uma  route "/clients"', () async {
      expect(clientsController.route, '/clients');
    });
    test('deve conter uma key "GET" para GetClientsHandler', () async {
      expect(clientsController.handlers['GET'], isA<GetClientsHandler>());
    });
  });
}
