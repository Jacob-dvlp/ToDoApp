import 'package:todo_app/src/core/reposistory/repository.dart';

abstract interface class UserLocalUsecaseI {
  Future<Either<Failure, bool>> createUserInLocalStorege(
      {required UserEntite userEntite});

  Future<Either<Failure, UserEntite>> getUser();

  Future<Either<Failure, bool>> deleteUser();
}
