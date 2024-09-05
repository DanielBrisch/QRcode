import 'package:flutter_triple/flutter_triple.dart';

class LoginSelectionState {}

class LoginSelectionStore extends Store<LoginSelectionState> {
  LoginSelectionStore() : super(LoginSelectionState());

  @override
  void initStore() {
    super.initStore();
    setLoading(true);
    setLoading(false);
    update(state, force: true);
  }
}
