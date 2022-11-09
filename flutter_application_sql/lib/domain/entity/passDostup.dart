import 'package:flutter_application_sql/domain/entity/pass.dart';
import 'package:flutter_application_sql/domain/entity/dostup.dart';

class PassDostupEntity {
  late int id;
  final int idPass;
  final DostupEnum idDostup;

  PassDostupEntity({
    this.id = 0,
    required this.idPass,
    required this.idDostup,
  });
}
