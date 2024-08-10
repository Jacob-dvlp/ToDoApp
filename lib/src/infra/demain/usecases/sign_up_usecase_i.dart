import "usecases.dart";

abstract interface class UserLoginUsecaseI {
  Future<Either<Failure, UserEntite>> userSignUp(
      {required String email, required String password});
}
