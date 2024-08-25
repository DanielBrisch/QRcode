import 'package:drift/drift.dart';

@DataClassName('QrCodeTable')
class QrCodeData extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idUser =>
      integer().customConstraint('REFERENCES UsersTable(id)')();
  TextColumn get url => text()();
  TextColumn get color => text()();
}
