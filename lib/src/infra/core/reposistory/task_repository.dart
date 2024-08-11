import '../datasource/local/database.dart';
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
      var dbClient = await taskDatabase.database;
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
}
