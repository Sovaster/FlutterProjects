import 'package:flutter_application_sql/domain/entity/sotrudnik.dart';
import 'package:flutter_application_sql/domain/entity/pass.dart';
import 'package:flutter_application_sql/domain/entity/car.dart';

class Pass extends PassEntity {
  Pass({
    super.id = 0,
    required super.idSotr,
    required super.idCar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_sotr': idSotr,
      'id_car': idCar,
    };
  }

  factory Pass.toFromMap(Map<String, dynamic> json) {
    return Pass(
      id: json['id'] as int,
      idSotr: json['id_sotr'] as int,
      idCar: json['id_car'] as int,
    );
  }
}
