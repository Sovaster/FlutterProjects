import 'package:flutter_application_sql/domain/entity/model.dart';

class MarkEntity {
  late int id;
  final String mark;
  final ModelEnum idModel;

  MarkEntity({
    this.id = 0,
    required this.mark,
    required this.idModel,
  });
}
