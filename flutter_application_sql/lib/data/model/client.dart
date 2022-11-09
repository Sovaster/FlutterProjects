import 'package:flutter_application_sql/domain/entity/client.dart';

class Client extends ClientEntity {
  Client({
    super.id = 0,
    required super.fam,
    required super.name,
    required super.otch,
  });

  Map<String, dynamic> toMap() {
    return {
      'fam': fam,
      'name': name,
      'otch': otch,
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      fam: json['fam'],
      name: json['name'],
      otch: json['otch'],
    );
  }
}
