import 'package:todo_app/src/infra/core/datasource/firebase/firebase.dart';

class ExceptionCustom extends FirebaseAuthException {
  ExceptionCustom({required super.code});
}
