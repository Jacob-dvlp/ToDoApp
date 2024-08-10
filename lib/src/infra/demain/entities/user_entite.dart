import 'entities.dart';

class UserEntite extends Equatable {
  final String? userEmail;
  final String? userUid;
  final String? userPassWord;
  final ReponseEntitie? reponseEntitie;

  const UserEntite({
    this.userEmail,
    this.userPassWord,
    this.userUid,
    this.reponseEntitie,
  });

  @override
  List<Object?> get props => [
        userEmail,
        userPassWord,
        userUid,
        reponseEntitie,
      ];
}
