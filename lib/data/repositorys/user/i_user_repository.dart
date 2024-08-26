import 'package:qrcode/data/db/database.dart';

import '../../../model/user_model.dart';

abstract class IUserRepository {
  Future<List<UsersTable>> get getAllUsers;

  Future<void> insertUser(User user);
}
