import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/src/core/reposistory/repository.dart';
import 'package:todo_app/src/services/locator.dart';

import '../../../utils/mocks/mocks.mocks.dart';

void main() {
  late final DetailsRepositoryI detailsRepositoryI;
  late final DetailsUsecaseImp detailsUsecaseImp;
  TaskEntitie? task;
  setUpAll(
    () async {
      detailsRepositoryI = MockDetailsRepositoryI();
      detailsUsecaseImp =
          DetailsUsecaseImp(detailsRepositoryI: detailsRepositoryI);

      task = const TaskEntitie(
          date: "12/03/2024",
          id: 1,
          description: "Estudar flutter",
          title: "Programação");
    },
  );

  test(
    "should return one task",
    () async {
      when(detailsRepositoryI.getTaskById(id: "1")).thenAnswer(
        (_) async => Right(task!),
      );
      final result = await detailsUsecaseImp.getTaskById(id: "1");
      expect(result, Right(task!));
    },
  );

  test(
    "should return a message if there is an error when searching for a task",
    () async {
      when(detailsRepositoryI.getTaskById(id: "1")).thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await detailsUsecaseImp.getTaskById(id: "1");
      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );

  test(
    "should return true if the task is deleted successfully",
    () async {
      when(detailsRepositoryI.deleteTaskById(id: "1")).thenAnswer(
        (_) async => const Right(true),
      );
      final result = await detailsUsecaseImp.deleteTaskById(id: "1");
      expect(result, const Right(true));
    },
  );

  test(
    "should return true if the task is deleted successfully",
    () async {
      when(detailsRepositoryI.updateTaskById(
              id: "1", description: "dart", title: "Flutter"))
          .thenAnswer(
        (_) async => const Right(true),
      );
      final result = await detailsUsecaseImp.updateTaskById(
          id: "1", description: "dart", title: "Flutter");
      expect(result, const Right(true));
    },
  );

  test(
    "should return an error message if there is an error updating a task",
    () async {
      when(detailsRepositoryI.updateTaskById(
              id: "1", description: "dart", title: "Flutter"))
          .thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await detailsUsecaseImp.updateTaskById(
          id: "1", description: "dart", title: "Flutter");
          
      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );
}
