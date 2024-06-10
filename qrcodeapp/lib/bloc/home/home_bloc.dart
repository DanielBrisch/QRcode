import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcodeapp/bloc/home/home_event.dart';
import 'package:qrcodeapp/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }

  void _onLoadUserProfile(
      LoadUserProfile event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const UserProfileLoaded('Daniel Brisch', 'Mobile Developer'));
    } catch (error) {
      emit(const HomeError('Failed to load user profile'));
    }
  }
}
