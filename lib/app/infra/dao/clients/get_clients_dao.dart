part of infra;

class GetCLientsDAO implements GetClientsGateway {
  final Connection connection;

  GetCLientsDAO({required this.connection});
  @override
  Future<List<ClientEntity>> call() async {
    try {
      final rows = await connection.query('statement');
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
          .toList();
    } finally {
      await connection.close();
    }
  }
}
