class ModelEntity {
  late int id;
  final String model;

  ModelEntity({required this.model});
}

enum ModelEnum {
  model1(id: 1, model: 'X6'),
  model2(id: 2, model: 'X5'),
  model3(id: 3, model: 'M5'),
  model4(id: 4, model: 'M4');

  const ModelEnum({
    required this.id,
    required this.model,
  });

  final String model;
  final int id;
}
