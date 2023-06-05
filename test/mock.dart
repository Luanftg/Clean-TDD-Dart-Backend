import 'package:kadosh_backend/app/data/data.dart';
import 'package:kadosh_backend/app/domain/domain.dart';
import 'package:kadosh_backend/app/domain/entities/user/client_entity.dart';

import 'package:kadosh_backend/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientsUsecase extends Mock implements GetClientsUsecase {}

class MockAddClientesUsecase extends Mock implements AddClientsUseCase {}

class MockAddClientsGateteway extends Mock implements AddClientsGateway {}

class MockGetClientByEmail extends Mock implements GetClientByEmailGateway {}

class MockGetClientsGateway extends Mock implements GetClientsGateway {}

class MockConnection extends Mock implements Connection {}

final clientMock = ClientEntity(
  id: 1,
  name: 'name',
  email: 'email',
  phoneNumber: '12-99721-8875',
);
