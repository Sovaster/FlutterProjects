import 'package:flutter_application_sql/domain/entity/client.dart';
import 'package:flutter_application_sql/domain/entity/mark.dart';
import 'package:flutter_application_sql/domain/entity/car.dart';

class Car extends CarEntity {
  Car({
    super.id = 0,
    required super.number,
    required super.year,
    required super.idClient,
    required super.idMark,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'year': year,
      'id_client': idClient,
      'id_mark': idMark,
    };
  }

  factory Car.toFromMap(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as int,
      number: json['number'],
      year: json['year'],
      idClient: json['id_client'] as int,
      idMark: json['id_mark'] as int,
    );
  }
}
