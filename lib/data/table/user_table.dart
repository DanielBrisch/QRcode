import 'package:drift/drift.dart';

@DataClassName('UsersTable')
class UsersData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get email => text()();
  TextColumn get image => text()();
}
