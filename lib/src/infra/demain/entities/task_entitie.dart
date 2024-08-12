import 'entities.dart';

class TaskEntitie extends Equatable {
  final String? isDone;
  final String? title;
  final String? date;
  final String? description;
  final int? id;

  const TaskEntitie({
    this.isDone,
    this.title,
    this.date,
    this.description,
    this.id,
  });

  @override
  List<Object?> get props => [isDone, title, date, description, id];
}
