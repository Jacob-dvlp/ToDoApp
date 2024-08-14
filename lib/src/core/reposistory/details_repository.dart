import 'repository.dart';

class DetailsRepository implements DetailsRepositoryI {
  final TaskDatabase taskDatabase;

  DetailsRepository({required this.taskDatabase});

  @override
  Future<Either<Failure, TaskEntitie>> getTaskById({required String id}) async {
    try {
      final dbClient = await taskDatabase.database;
      final List<Map<String, Object?>> taskResult =
          await dbClient!.query('task', where: 'id = ?', whereArgs: [id]);
      final task = taskResult
          .map(
            (e) => TaskModel.fromMap(e),
          )
          .first;
      return Right(task!);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao buscar Tasks"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTaskById({required String id}) async {
    try {
      final dbClient = await taskDatabase.database;
      await dbClient!.delete('task', where: 'id = ?', whereArgs: [id]);
      return const Right(true);
    } catch (e) {
      return const Left(Failure(error: "Erro ao excluir Task"));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTaskById(
      {required String title,
      required String description,
      required String id}) async {
    try {
      final dbClient = await taskDatabase.database;

      await dbClient!.update(
          'task',
          {
            'title': title,
            'description': description,
          },
          where: 'id = ?',
          whereArgs: [id]);
      return const Right(true);
    } catch (e) {
      return const Left(Failure(error: "Erro ao atualizar a tarefa"));
    }
  }
}
