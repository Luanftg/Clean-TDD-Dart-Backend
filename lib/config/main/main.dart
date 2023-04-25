part of config;

final controllers = <Controller>[
  ClientsController(
    getClientsUsecase: GetClientService(
      getClientsGateway: GetCLientsDAO(
        connection: FakeDB(),
      ),
    ),
  )
];
