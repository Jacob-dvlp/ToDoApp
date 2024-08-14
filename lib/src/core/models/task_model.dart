import 'dart:convert';

import '../reposistory/repository.dart';

class TaskModel extends TaskEntitie {
  final String isDoneTask;
  final String titleTask;
  final int idTask;
  final String dateTask;
  final String descriptionTask;

  const TaskModel(
      {required this.isDoneTask,
      required this.titleTask,
      required this.dateTask,
      required this.descriptionTask,
      required this.idTask})
      : super(
            date: dateTask,
            description: descriptionTask,
            isDone: isDoneTask,
            title: titleTask,
            id: idTask);

  Map<String, dynamic> toMap() {
    return {
      'isDone': isDoneTask,
      'title': titleTask,
      'date': dateTask,
      'description': descriptionTask,
    };
  }

  static TaskModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return TaskModel(
          isDoneTask: map['isDone'],
          titleTask: map['title'],
          dateTask: map['date'],
          descriptionTask: map['description'],
          idTask: map['id']);
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static TaskModel? fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
