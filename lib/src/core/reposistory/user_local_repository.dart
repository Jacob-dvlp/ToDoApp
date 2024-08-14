import 'repository.dart';

class UserLocalRepository implements UserLocalRepositoryI {
  final UserDatabase userDatabase;

  UserLocalRepository({required this.userDatabase});
  @override
  Future<Either<Failure, bool>> createUserInLocalStorege(
      {required UserEntite userEntite}) async {
    try {
      final dbClient = await userDatabase.database;
      await dbClient!.insert('user', {
        'email': userEntite.userEmail,
        'token': userEntite.userUid,
      });
      return const Right(true);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao salvar Task"),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final dbClient = await userDatabase.database;
      final List<Map<String, Object?>> taskResult =
          await dbClient!.query('user');
      final task = taskResult
          .map(
            (e) => UserModel.fromMap(e),
          )
          .first;
      return Right(task!);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao buscar  usuário"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser() async {
    try {
      final dbClient = await userDatabase.database;
      await dbClient!.delete('user');
      return const Right(true);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao excluir  o usuário"),
      );
    }
  }
}
