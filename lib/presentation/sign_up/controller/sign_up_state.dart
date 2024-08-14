part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class InitialSignUpState extends SignUpState {}

final class LoadingSignUpState extends SignUpState {}

final class LoadedSignUpState extends SignUpState {
  final UserEntite userEntite;

  LoadedSignUpState({required this.userEntite});
}

class ErrorSignUpState extends SignUpState {
  final String error;

  ErrorSignUpState({required this.error});
}
