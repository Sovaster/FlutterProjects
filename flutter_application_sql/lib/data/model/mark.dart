import 'package:flutter_application_sql/domain/entity/model.dart';
import 'package:flutter_application_sql/domain/entity/mark.dart';

class Mark extends MarkEntity {
  Mark({
    super.id = 0,
    required super.mark,
    required super.idModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'mark': mark,
      'id_model': idModel.id,
    };
  }

  factory Mark.toFromMap(Map<String, dynamic> json) {
    return Mark(
      id: json['id'] as int,
      mark: json['mark'],
      idModel: ModelEnum.values
          .firstWhere((element) => element.id == (json['id_model'] as int)),
    );
  }
}
