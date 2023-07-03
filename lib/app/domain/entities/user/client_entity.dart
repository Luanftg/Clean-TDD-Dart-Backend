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
}
