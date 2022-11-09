import 'package:flutter_application_sql/domain/entity/model.dart';

class Model extends ModelEntity {
  Model({required super.model});

  Map<String, dynamic> toMap() {
    return {'model': model};
  }

  factory Model.toFromMap(Map<String, dynamic> json) {
    return Model(model: json['model']);
  }
}
