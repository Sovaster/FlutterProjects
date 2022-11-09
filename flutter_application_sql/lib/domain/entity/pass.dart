import 'package:flutter_application_sql/domain/entity/sotrudnik.dart';
import 'package:flutter_application_sql/domain/entity/car.dart';

class PassEntity {
  late int id;
  final int idSotr;
  final int idCar;

  PassEntity({
    this.id = 0,
    required this.idSotr,
    required this.idCar,
  });
}
