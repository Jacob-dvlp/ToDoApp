part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class LoadingSignInState extends SignInState {}

final class LoadedSignInState extends SignInState {
  final UserEntite userEntite;

  LoadedSignInState({required this.userEntite});
}

class ErrorSignInState extends SignInState {
  final String error;

  ErrorSignInState({required this.error});
}
