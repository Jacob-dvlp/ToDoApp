import '../usecases/usecases.dart';

abstract interface class UserLocalRepositoryI {
  Future<Either<Failure, bool>> createUserInLocalStorege(
      {required UserEntite userEntite});

  Future<Either<Failure, UserEntite>> getUser();

  Future<Either<Failure, bool>> deleteUser();
}
