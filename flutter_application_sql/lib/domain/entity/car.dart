import 'package:flutter_application_sql/domain/entity/client.dart';
import 'package:flutter_application_sql/domain/entity/mark.dart';

class CarEntity {
  late int id;
  final String number;
  final String year;
  final int idClient;
  final int idMark;

  CarEntity({
    this.id = 0,
    required this.number,
    required this.year,
    required this.idClient,
    required this.idMark,
  });
}
