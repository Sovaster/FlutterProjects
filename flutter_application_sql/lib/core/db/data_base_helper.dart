import 'dart:io';

import 'package:flutter_application_sql/common/data_base_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
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

    _pathDB = join(_appDocumentDirectory.path, 'Flutter_SQL/test.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onCreate: (db, version) {},
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) {},
      );
    }
  }

  void onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }
  }

  void onDropDataBse() async {
    await database.close();

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
