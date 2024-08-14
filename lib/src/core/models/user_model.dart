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

  static UserModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return UserModel(
        userEmailModel: map['email'],
        userUidModel: map['token'],
      );
    } catch (e) {
      return null;
    }
  }
}
