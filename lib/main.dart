import 'package:todo_app/src/infra/services/locator_service.dart';

import 'app_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(
    const AppWidget(),
  );
}
