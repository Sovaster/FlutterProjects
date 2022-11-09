import 'package:flutter_application_sql/domain/entity/pass.dart';
import 'package:flutter_application_sql/domain/entity/dostup.dart';
import 'package:flutter_application_sql/domain/entity/passDostup.dart';

class PassDostup extends PassDostupEntity {
  PassDostup({
    super.id = 0,
    required super.idPass,
    required super.idDostup,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_pass': idPass,
      'id_dostup': idDostup.id,
    };
  }

  factory PassDostup.toFromMap(Map<String, dynamic> json) {
    return PassDostup(
      id: json['id'] as int,
      idPass: json['id_pass'],
      idDostup: DostupEnum.values
          .firstWhere((element) => element.id == (json['id_dostup'] as int)),
    );
  }
}
