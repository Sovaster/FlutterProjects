abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = "role";
  static const String tableModel = "model";
  static const String tableDostup = "dostup";
  static const String tableClient = "client";
  static const String tableMark = "mark";
  static const String tableCar = "car";
  static const String tablePass = "pass";
  static const String tablePassDostup = "passDostup";
  static const String tableSotrudnik = "sotrudnik";

  static const List<String> tableList = [
    tableRole,
    tableModel,
    tableDostup,
    tableClient,
    tableMark,
    tableCar,
    tableSotrudnik,
    tablePass,
    tablePassDostup
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableModel,
    _createTableDostup,
    _createTableClient,
    _createTableMark,
    _createTableCar,
    _createTableSotrudnik,
    _createTablePass,
    _createTablePassDostup
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Model
  static const String _createTableModel =
      'CREATE TABLE "$tableModel" ("id" INTEGER,"model" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Dostup
  static const String _createTableDostup =
      'CREATE TABLE "$tableDostup" ("id" INTEGER,"dostup" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Client
  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id"	INTEGER,"fam" TEXT NOT NULL,"name"	TEXT NOT NULL,"otch"	TEXT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Mark
  static const String _createTableMark =
      'CREATE TABLE "$tableMark" ("id"	INTEGER,"mark" TEXT NOT NULL,"id_model"	INTEGER,FOREIGN KEY("id_model") REFERENCES "model"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Car
  static const String _createTableCar =
      'CREATE TABLE "$tableCar" ("id"	INTEGER,"number" TEXT NOT NULL,"year"	TEXT NOT NULL,"id_mark"	INTEGER, "id_client" INTEGER, FOREIGN KEY ("id_client") REFERENCES "client"("id") ON DELETE CASCADE, FOREIGN KEY("id_mark") REFERENCES "mark"("id") ON DELETE CASCADE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Pass
  static const String _createTablePass =
      'CREATE TABLE "$tablePass" ("id"	INTEGER,"id_car"	INTEGER,"id_sotr"	INTEGER,FOREIGN KEY("id_sotr") REFERENCES "sotrudnik"("id") ON DELETE CASCADE, FOREIGN KEY("id_car") REFERENCES "car"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы PassDostup
  static const String _createTablePassDostup =
      'CREATE TABLE "$tablePassDostup" ("id"	INTEGER,"id_dostup"	INTEGER,"id_pass"	INTEGER,FOREIGN KEY("id_pass") REFERENCES "pass"("id") ON DELETE CASCADE,FOREIGN KEY("id_dostup") REFERENCES "dostup"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Sotrudnik
  static const String _createTableSotrudnik =
      'CREATE TABLE "$tableSotrudnik" ("id"	INTEGER,"fam" TEXT NOT NULL,"name"	TEXT NOT NULL,"otch"	TEXT NULL,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
}
