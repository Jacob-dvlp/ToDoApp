import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/src/infra/core/reposistory/repository.dart';
import 'package:todo_app/src/infra/services/locator.dart';

import '../../../utils/mocks/mocks.mocks.dart';

void main() {
  late final TaskRepositoryI taskRepository;
  late final TaskUsecaseImp signInUsecaseI;
  List<TaskEntitie> task = [];
  setUpAll(
    () async {
      taskRepository = MockTaskRepositoryI();
      signInUsecaseI = TaskUsecaseImp(taskRepositoryI: taskRepository);

      task.add(const TaskEntitie(
          date: "12/03/2024",
          id: 1,
          description: "Estudar flutter",
          title: "Programação"));
    },
  );

  test(
    "should return a 1 if successful and 0 if an error occurs",
    () async {
      when(taskRepository.createTask(
              isDone: "0",
              title: "Teste",
              date: "13/03/2024",
              description:
                  " Lorem ipsum dolor sit amet, consectetur adipiscing"))
          .thenAnswer(
        (_) async => const Right(1),
      );
      final result = await signInUsecaseI.createTask(
          isDone: "0",
          title: "Teste",
          date: "13/03/2024",
          description: " Lorem ipsum dolor sit amet, consectetur adipiscing");
      expect(result, const Right(1));
    },
  );

  test(
    "should return an error message if saving fails",
    () async {
      when(taskRepository.createTask(
              isDone: "",
              title: "",
              date: "",
              description:
                  " Lorem ipsum dolor sit amet, consectetur adipiscing"))
          .thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await signInUsecaseI.createTask(
          isDone: "",
          title: "",
          date: "",
          description: " Lorem ipsum dolor sit amet, consectetur adipiscing");

      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );

  test(
    "should return true if the task is completed",
    () async {
      when(taskRepository.completetask(isDone: "0", id: 1)).thenAnswer(
        (_) async => const Right(true),
      );
      final result = await signInUsecaseI.completetask(isDone: "0", id: 1);

      expect(result, const Right(true));
    },
  );

  test(
    "should return true if all tasks are deleted",
    () async {
      when(taskRepository.deleteAllTasks()).thenAnswer(
        (_) async => const Right(true),
      );
      final result = await signInUsecaseI.deleteAllTasks();

      expect(result, const Right(true));
    },
  );

  test(
    "should return  an error message if the taskS is not deleted",
    () async {
      when(taskRepository.deleteAllTasks()).thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await signInUsecaseI.deleteAllTasks();

      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );

  test(
    "should return  an error message if the task is not completed",
    () async {
      when(taskRepository.completetask(isDone: "0", id: 1)).thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await signInUsecaseI.completetask(isDone: "0", id: 1);

      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );

  test(
    "should return a list of tasks",
    () async {
      when(taskRepository.getTaskList()).thenAnswer(
        (_) async => Right(task),
      );
      final result = await signInUsecaseI.getTaskList();

      expect(result, Right(task));
    },
  );

  test(
    "should return a message if there is an error when searching for tasks",
    () async {
      when(taskRepository.getTaskList()).thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await signInUsecaseI.getTaskList();

      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );
}
