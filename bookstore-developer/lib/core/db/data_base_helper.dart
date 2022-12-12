import 'dart:io';

import 'package:bookstore/common/data_base_request.dart';
import 'package:bookstore/data/model/role.dart';
import 'package:bookstore/data/model/users.dart';
import 'package:bookstore/domain/entity/role_entity.dart';
import "package:path/path.dart";
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Класс отвечающий за работу с баззой данных
/// две основные функции это создание базы ланных и удаление базы данных
class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Database dataBase;
  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  final int _version = 14;

  /// Функция иницилизации базы данных
  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'boockstore.db');

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(
        _pathDB,
        options: OpenDatabaseOptions(
          version: _version,
          onUpgrade: (db, oldVersion, newVersion) async =>
              await onUpdateTable(db),
          onCreate: (db, version) async {
            await onCreateTable(db);
          },
        ),
      );
    } else {
      dataBase = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) async {
          await onCreateTable(db);
        },
      );
    }
  }

  /// Функция для обновлении таблиц
  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name  FROM sqlite_master;');
    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var createTable in DataBaseRequest.tableCreateList) {
      await db.execute(createTable);
    }
    await onInitTable(db);
  }

  /// Функция создания таблиц
  Future<void> onCreateTable(Database db) async {
    for (var createTable in DataBaseRequest.tableCreateList) {
      await db.execute(createTable);
    }
    await onInitTable(db);
  }

  Future onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователь').toMap());
      db.insert(
        DataBaseRequest.tableUsers,
        Users(
          login: 'admin',
          password: 'admin123',
          idRole: RoleEnum.admin,
        ).toMap(),
      );
    } on DatabaseException catch (e) {}
  }

  /// Функция удаления базы данных
  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
