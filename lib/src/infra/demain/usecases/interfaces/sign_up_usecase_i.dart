import "../usecases.dart";

abstract interface class SignUpUsecaseI {
  Future<Either<Failure, UserEntite>> userSignUp(
      {required String email, required String password});
}
