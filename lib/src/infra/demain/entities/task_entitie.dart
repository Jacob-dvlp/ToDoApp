import 'entities.dart';

class TaskEntitie extends Equatable {
  final int isDone;
  final String title;
  final String date;
  final String description;

  const TaskEntitie(
      {required this.isDone,
      required this.title,
      required this.date,
      required this.description});

  @override
  List<Object?> get props => [isDone, title, date, description];
}
