class ClientEntity {
  int id;
  String name;
  final String email;
  String? photoUrl;
  String? phoneNumber;
  String? password;
  bool isAuthenticated;
  ClientEntity({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.phoneNumber,
    this.password,
    this.isAuthenticated = false,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, photoUrl: $photoUrl, phoneNumber: $phoneNumber, password: $password, isAuthenticated: $isAuthenticated)';
  }
}
