part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final UserEntite? userEntite;
  final bool? logout;

  UserLoadedState({this.userEntite, this.logout});
}

final class UserLogoutState extends UserState {}

class UserErrorState extends UserState {
  final String error;

  UserErrorState({required this.error});
}
