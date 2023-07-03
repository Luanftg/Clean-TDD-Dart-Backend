part of config;

final connection = PostgresSQL();

final controllers = <Controller>[
  ClientsController(
    addClientsUseCase: AddClientService(
      addClientsGateway: AddClientDAO(connection: connection),
      getClientByEmail: GetClientByEmailDAO(connection),
    ),
    getClientsUsecase: GetClientService(
      getClientsGateway: GetCLientsDAO(connection: connection),
    ),
  )
];
