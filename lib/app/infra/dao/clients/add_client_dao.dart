part of infra;

class AddClientDAO implements AddClientsGateway {
  final Connection connection;

  AddClientDAO({required this.connection});
  @override
  Future<ClientEntity> call(ClientEntity clientEntity) async {
    try {
      final rows = await connection.query(
        'INSERT INTO clients (name, email, phone) values (@name, @email, @phone) returning *',
        {
          'name': clientEntity.name,
          'email': clientEntity.email,
          // 'password': clientEntity.password,
          'phone': clientEntity.phoneNumber,
          // 'photo_url': clientEntity.photoUrl,
        },
      );
      return rows.map(ClientDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
