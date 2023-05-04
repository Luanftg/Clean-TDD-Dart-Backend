part of infra;

class PostgresSQL implements Connection {
  late PostgreSQLConnection? _postgreSQLConnection;

  @override
  Future<void> close() async {
    // if (_postgreSQLConnection != null) {
    //   _postgreSQLConnection!.close();
    // }
    await _postgreSQLConnection?.close();
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String statement, [
    Map<String, dynamic> params = const {},
  ]) async {
    _postgreSQLConnection = PostgreSQLConnection(
      'localhost',
      5432,
      'postgres',
      username: 'postgres',
      password: 'docker',
    );
    await _postgreSQLConnection!.open();
    List<Map<String, dynamic>> map = [];

    final PostgreSQLResult rows = await _postgreSQLConnection!
        .query(statement, substitutionValues: params);

    for (final row in rows) {
      map.add(row.toColumnMap());
    }
    return map;
  }
}
