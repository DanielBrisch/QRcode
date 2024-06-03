// lib/bloc/home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:qrcodeapp/bloc/home_event.dart';
import 'package:qrcodeapp/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadUserProfile>((event, emit) {
      // Simulate loading user profile
      const userName = 'Daniel Brisch';
      const userJob = 'Mobile Developer';
      emit(const UserProfileLoaded(userName, userJob));
    });
  }
}
