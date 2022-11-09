import 'package:flutter_application_sql/domain/entity/dostup.dart';

class Dostup extends DostupEntity {
  Dostup({required super.dostup});

  Map<String, dynamic> toMap() {
    return {'dostup': dostup};
  }

  factory Dostup.toFromMap(Map<String, dynamic> json) {
    return Dostup(dostup: json['dostup']);
  }
}
