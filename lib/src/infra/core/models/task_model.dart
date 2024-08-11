import 'dart:convert';

import '../reposistory/repository.dart';

class TaskModel extends TaskEntitie {
  final int isDoneModel;
  final String titleModel;
  final String dateModel;
  final String descriptionModel;

  const TaskModel(
      {required this.isDoneModel,
      required this.titleModel,
      required this.dateModel,
      required this.descriptionModel})
      : super(
            date: dateModel,
            description: descriptionModel,
            isDone: isDoneModel,
            title: titleModel);

  Map<String, dynamic> toMap() {
    return {
      'isDone': isDone,
      'title': title,
      'date': date,
      'description': description,
    };
  }

  static TaskModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return TaskModel(
        isDoneModel: map['isDone'],
        titleModel: map['title'],
        dateModel: map['date'],
        descriptionModel: map['description'],
      );
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static TaskModel? fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
