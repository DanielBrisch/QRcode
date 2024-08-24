import 'package:qrcode/data/db/database.dart';

abstract class IUserRepository {
  Future<List<User>> get getAllUsers;

  Future<void> insertUser(String name, String role);
}
