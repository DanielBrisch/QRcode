import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SingInState {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}

class SingInStore extends Store<SingInState> {
  SingInStore() : super(SingInState());

  @override
  void initStore() {
    super.initStore();
    setLoading(true);
    setLoading(false);
    update(state);
  }
}
