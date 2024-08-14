import 'repository.dart';

class TaskRepository implements TaskRepositoryI {
  final TaskDatabase taskDatabase;

  TaskRepository({required this.taskDatabase});

  @override
  Future<Either<Failure, int>> createTask(
      {required String isDone,
      required String title,
      required String date,
      required String description}) async {
    try {
      final dbClient = await taskDatabase.database;
      final data = await dbClient!.insert('task', {
        'isDone': isDone,
        'title': title,
        'date': date,
        'description': description,
      });
      return Right(data);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao salvar Task"),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskModel?>>> getTaskList() async {
    try {
      final dbClient = await taskDatabase.database;

      final List<Map<String, Object?>> queryResult =
          await dbClient!.query('task');
      final taskList = queryResult.map((e) => TaskModel.fromMap(e)).toList();
      return Right(taskList);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao buscar Tasks"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllTasks() async {
    try {
      final dbClient = await taskDatabase.database;
      await dbClient!.delete('task');
      return const Right(true);
    } catch (e) {
      return const Left(
        Failure(error: "Erro ao excluir a Lista"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> completetask(
      {required int id, required String isDone}) async {
    try {
      final dbClient = await taskDatabase.database;

      await dbClient!.update(
          'task',
          {
            'isDone': isDone,
          },
          where: 'id = ?',
          whereArgs: [id]);
      return const Right(true);
    } catch (e) {
      return const Left(Failure(error: "Erro ao atualizar a tarefa"));
    }
  }
}
