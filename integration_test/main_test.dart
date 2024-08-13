import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  group(
    "Integration teste",
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      app.main();
      testWidgets(
        "full app test",
        (widgetTester) async {
          await widgetTester.pumpAndSettle();

          final email = find.byKey(const Key("email-field"));
          final password = find.byKey(const Key("password-field"));
          final buttom = find.byKey(const Key("ElevatedButton-login"));
          await widgetTester.pump(const Duration(seconds: 3));
          await widgetTester.enterText(email, "admin@gmail.com");
          await widgetTester.enterText(password, "123123123");
          await widgetTester.pump();
          await widgetTester.pumpAndSettle();
          await widgetTester.pump(const Duration(seconds: 3));

          await widgetTester.tap(buttom);
          await widgetTester.pumpAndSettle();
        },
      );
    },
  );
}
