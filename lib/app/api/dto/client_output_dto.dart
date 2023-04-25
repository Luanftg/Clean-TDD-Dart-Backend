part of api;

class ClientOutputDTO {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  ClientOutputDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory ClientOutputDTO.toDTO(ClientEntity client) {
    return ClientOutputDTO(
      id: client.id,
      name: client.name,
      email: client.email,
      phoneNumber: client.phoneNumber ?? '',
    );
  }

  static List<ClientOutputDTO> toCollectionDTO(List<ClientEntity> clients) {
    return clients.map(ClientOutputDTO.toDTO).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': 1,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}
