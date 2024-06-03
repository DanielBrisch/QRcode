import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class UserProfileLoaded extends HomeState {
  final String name;
  final String job;

  const UserProfileLoaded(this.name, this.job);

  @override
  List<Object> get props => [name, job];
}
