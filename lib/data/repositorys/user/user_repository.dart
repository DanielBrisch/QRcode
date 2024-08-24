import 'package:drift/drift.dart';
import 'package:qrcode/data/db/database.dart';
import 'package:qrcode/data/repositorys/user/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final database = DataBase();

  @override
  Future<void> insertUser(String name, String role) async {
    await database.into(database.users).insert(
          UsersCompanion.insert(
            name: name,
            content: Value(
              role,
            ),
          ),
        );
  }

  @override
  Future<List<User>> get getAllUsers async {
    return await database.select(database.users).get();
  }
}
