import '../demain/entities/entities.dart';

class Failure extends Equatable {
  final String? error;

  const Failure({this.error});

  @override
  List<Object?> get props => [error];
}
