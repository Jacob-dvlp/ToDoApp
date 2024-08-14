import '../usecases/usecases.dart';

abstract interface class SignInRepositoryI {
  Future<Either<Failure, UserEntite>> userSignIn(
      {required String email, required String password});
}
