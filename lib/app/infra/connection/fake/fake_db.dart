part of infra;

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print('close connection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(String statement,
      [Map<String, dynamic> params = const {}]) async {
    return [
      {
        'id': 1,
        'name': 'name',
        'email': 'email@email.com',
        'phone_number': '12-99721-8878',
        'photo_url': 'http://minhafoto.com.br',
        'is_authenticated': false,
        'password': 'password123'
      }
    ];
  }
}
