import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:qrcode/data/table/settings_table.dart';
import 'package:qrcode/data/table/user_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [UsersData, SettingsData])
class DataBase extends _$DataBase {
  DataBase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
