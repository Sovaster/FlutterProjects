class DostupEntity {
  late int id;
  final String dostup;

  DostupEntity({required this.dostup});
}

enum DostupEnum {
  reu1(id: 1, dostup: 'РЭУ 1'),
  reu2(id: 2, dostup: 'РЭУ 2'),
  reu3(id: 3, dostup: 'РЭУ 3'),
  reu4(id: 4, dostup: 'Главные ворота');

  const DostupEnum({
    required this.id,
    required this.dostup,
  });

  final String dostup;
  final int id;
}
