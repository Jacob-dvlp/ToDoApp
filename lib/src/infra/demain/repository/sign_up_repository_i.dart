import '../usecases/usecases.dart';

abstract interface class SignUpRepositoryI {
  Future<Either<Failure, UserEntite>> userSignUp(
      {required String email, required String password});
}
