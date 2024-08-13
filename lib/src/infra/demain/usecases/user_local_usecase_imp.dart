import '../../core/reposistory/repository.dart';

class UserLocalUsecaseImp implements UserLocalUsecaseI {
  final UserLocalRepositoryI userLocalRepositoryI;

  UserLocalUsecaseImp({required this.userLocalRepositoryI});
  @override
  Future<Either<Failure, bool>> createUserInLocalStorege(
      {required UserEntite userEntite}) async {
    final response = await userLocalRepositoryI.createUserInLocalStorege(
        userEntite: userEntite);

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, UserEntite>> getUser() async {
    final response = await userLocalRepositoryI.getUser();

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteUser() async {
    final response = await userLocalRepositoryI.deleteUser();

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => Right(data),
    );
  }
}
