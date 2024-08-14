import 'package:todo_app/src/services/locator_service.dart';

import 'app_exports.dart';
import 'src/services/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  final result = await locator.get<UserLocalUsecaseI>().getUser();

  final user = result.fold(
    (l) => null,
    (r) => r,
  );
  bool accessToken = user?.userUid!.isNotEmpty ?? false;
  runApp(
    AppWidget(
      accessToken: accessToken,
    ),
  );
}
