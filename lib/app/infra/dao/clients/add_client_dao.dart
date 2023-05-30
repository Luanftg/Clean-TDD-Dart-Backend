part of infra;

class AddClientDAO implements AddClientsGateway {
  final Connection connection;

  AddClientDAO({required this.connection});
  @override
  Future<ClientEntity> call(ClientEntity clientEntity) async {
    try {
      final rows = await connection.query(
          'INSERT INTO clients (id, name, email, password, phone_number, is_authenticated, photo_url) values ',
          {
            'id': clientEntity.id,
            'name': clientEntity.name,
            'email': clientEntity.email,
            'password': clientEntity.password,
            'phone_number': clientEntity.phoneNumber,
            'photo_url': clientEntity.photoUrl,
          });
      return rows
          .map(
            (map) => ClientEntity(
              id: map['id'],
              name: map['name'],
              email: map['email'],
              password: map['password'],
              phoneNumber: map['phone_number'],
              isAuthenticated: map['is_authenticated'],
              photoUrl: map['photo_url'],
            ),
          )
          .first;
    } finally {
      await connection.close();
    }
  }
}
