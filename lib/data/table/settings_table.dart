import 'package:drift/drift.dart';

@DataClassName('SettingsTable')
class SettingsData extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idUser =>
      integer().customConstraint('REFERENCES UsersTable(id)')();
  TextColumn get duplicateBarCodes => text()();
  TextColumn get mute => text()();
  TextColumn get vibration => text()();
  TextColumn get copyToClipBoard => text()();
}
