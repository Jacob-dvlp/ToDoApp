import 'entities.dart';

class ReponseEntitie extends Equatable {
  final String messages;
  final UserEntite? userEntite;
  const ReponseEntitie({
    required this.messages,
    this.userEntite,
  });
  @override
  List<Object?> get props => [
        messages,
        userEntite,
      ];
}
