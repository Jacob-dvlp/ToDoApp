import '../../demain/entities/entities.dart';

class UserModel extends UserEntite {
  final String? userEmailModel;
  final String? userUidModel;

  const UserModel({
    this.userEmailModel,
    this.userUidModel,
  }) : super(
          userEmail: userEmailModel,
          userUid: userUidModel,
        );
}
