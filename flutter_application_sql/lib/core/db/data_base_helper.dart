import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_sql/common/data_base_request.dart';
import 'package:flutter_application_sql/data/model/car.dart';
import 'package:flutter_application_sql/data/model/client.dart';
import 'package:flutter_application_sql/data/model/dostup.dart';
import 'package:flutter_application_sql/data/model/mark.dart';
import 'package:flutter_application_sql/data/model/model.dart';
import 'package:flutter_application_sql/data/model/pass.dart';
import 'package:flutter_application_sql/data/model/passDostup.dart';
import 'package:flutter_application_sql/data/model/role.dart';
import 'package:flutter_application_sql/data/model/sotrudnik.dart';
import 'package:flutter_application_sql/domain/entity/dostup.dart';
import 'package:flutter_application_sql/domain/entity/model.dart';
import 'package:flutter_application_sql/domain/entity/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 2;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'Flutter_SQL/PR2_BD.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }
      for (var element in DostupEnum.values) {
        db.insert(DataBaseRequest.tableDostup,
            Dostup(dostup: element.dostup).toMap());
      }
      for (var element in ModelEnum.values) {
        db.insert(
            DataBaseRequest.tableModel, Model(model: element.model).toMap());
      }

      db.insert(
          DataBaseRequest.tableSotrudnik,
          Sotrudnik(
                  login: 'admin',
                  fam: 'Sova',
                  idRole: RoleEnum.admin,
                  otch: 'Sergeevich',
                  name: 'Nikita',
                  password: 'admin123')
              .toMap());
      db.insert(
          DataBaseRequest.tableSotrudnik,
          Sotrudnik(
                  login: 'user',
                  fam: 'Kuzmin',
                  idRole: RoleEnum.user,
                  otch: 'Olegovich',
                  name: 'Vlad',
                  password: 'user123')
              .toMap());

      db.insert(DataBaseRequest.tableClient,
          Client(fam: 'Valov', name: 'Ignat', otch: 'Olegovich').toMap());

      db.insert(DataBaseRequest.tableMark,
          Mark(mark: 'BMW', idModel: ModelEnum.model1).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(mark: 'BMW', idModel: ModelEnum.model2).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(mark: 'BMW', idModel: ModelEnum.model3).toMap());
      db.insert(DataBaseRequest.tableMark,
          Mark(mark: 'BMW', idModel: ModelEnum.model4).toMap());

      db.insert(
          DataBaseRequest.tableCar,
          Car(
            number: 'A199ВГ 777',
            year: '2020',
            idClient: 1,
            idMark: 1,
          ).toMap());
      db.insert(
          DataBaseRequest.tablePass,
          Pass(
            idSotr: 2,
            idCar: 1,
          ).toMap());

      db.insert(
          DataBaseRequest.tablePassDostup,
          PassDostup(
            idPass: 1,
            idDostup: DostupEnum.reu4,
          ).toMap());
      db.insert(
          DataBaseRequest.tablePassDostup,
          PassDostup(
            idPass: 1,
            idDostup: DostupEnum.reu3,
          ).toMap());
      db.insert(
          DataBaseRequest.tablePassDostup,
          PassDostup(
            idPass: 1,
            idDostup: DostupEnum.reu1,
          ).toMap());
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
    await onInitTable(db);
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onDropDataBse() async {
    await database.close();

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
