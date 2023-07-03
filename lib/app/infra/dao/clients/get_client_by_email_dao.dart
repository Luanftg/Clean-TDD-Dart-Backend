part of infra;

class GetClientByEmailDAO implements GetClientByEmailGateway {
  final Connection _connection;

  GetClientByEmailDAO(this._connection);
  @override
  Future<ClientEntity?> call(String email) async {
    try {
      final row =
          await _connection.query('SELECT * FROM clients WHERE email=@email', {
        'email': email,
      });

      if (row.isEmpty) return null;
      return row.map(ClientDB.toEntity).first;
    } finally {
      await _connection.close();
    }
  }
}
