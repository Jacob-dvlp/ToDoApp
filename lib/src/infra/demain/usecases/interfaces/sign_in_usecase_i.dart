import '../usecases.dart';

abstract interface class SignInUsecaseI {
  Future<Either<Failure, UserEntite>> userSignIn(
      {required String email, required String password});
}
