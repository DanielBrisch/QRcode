import 'package:qrcode/data/db/database.dart';
import 'package:qrcode/data/repositorys/user/i_user_repository.dart';
import 'package:qrcode/model/User.dart';

class UserRepository implements IUserRepository {
  final database = DataBase();

  @override
  Future<void> insertUser(User user) async {
    await database.into(database.usersData).insert(
          UsersDataCompanion.insert(
              firstName: user.firstName,
              lastName: user.lastName,
              position: user.position,
              email: user.email,
              image: user.image),
        );
  }

  @override
  Future<List<UsersTable>> get getAllUsers async {
    return await database.select(database.usersData).get();
  }
}
