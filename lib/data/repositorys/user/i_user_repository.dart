import 'package:qrcode/data/db/database.dart';
import 'package:qrcode/model/User.dart';

abstract class IUserRepository {
  Future<List<UsersTable>> get getAllUsers;

  Future<void> insertUser(User user);
}
