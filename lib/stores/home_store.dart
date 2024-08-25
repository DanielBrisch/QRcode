import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrcode/data/repositorys/user/i_user_repository.dart';
import 'package:qrcode/model/User.dart';

class HomeState {
  User? user;
}

class HomeStore extends Store<HomeState> {
  final IUserRepository userRepository;
  HomeStore({
    required this.userRepository,
  }) : super(HomeState());

  @override
  void initStore() async {
    super.initStore();
    setLoading(true);
    await loadUser();
    setLoading(false, force: true);
    update(state, force: true);
  }

  Future<void> loadUser() async {
    final result = await userRepository.getAllUsers;
    final firstUser = result.first;
    state.user = User(
      firstName: firstUser.firstName,
      lastName: firstUser.lastName,
      position: firstUser.position,
      email: firstUser.email,
      image: firstUser.image,
    );
  }
}
