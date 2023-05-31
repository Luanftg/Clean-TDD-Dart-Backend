part of api;

abstract class ClientInputDTO {
  static ClientEntity toEntity(Map<String, dynamic> map) {
    return ClientEntity(
      id: 0,
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phone_number'],
      password: map['password'],
      photoUrl: map['photo_url'],
    );
  }
}
