import 'dart:io';

import 'package:flutter_application_3/common/data_base_request.dart';
import 'package:flutter_application_3/data/model/role.dart';
import 'package:flutter_application_3/data/model/user.dart';
import 'package:flutter_application_3/domain/entity/role_enitty.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  void init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      // todo
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) {},
      );
    }
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

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
        DataBaseRequest.tableUser,
        User(
          login: 'admin',
          idRole: RoleEnum.admin,
          password: 'admin123',
        ).toMap(),
      );
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      // todo
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
