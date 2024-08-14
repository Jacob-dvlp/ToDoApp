import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/main.dart' as app;
import 'package:todo_app/src/utils/app_constants.dart';

void main() {
  group(
    "Integration teste",
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      app.main();
      testWidgets(
        "It must simulate the user logging into the app and it must also simulate task creation and task update.",
        (widgetTester) async {
          await widgetTester.pumpAndSettle();

          final email = find.byKey(const Key("email-field"));
          final password = find.byKey(const Key("password-field"));
          final buttom = find.byKey(const Key("elevatedButton-login"));
          await widgetTester.pump(const Duration(seconds: 3));
          final createTask = find.byKey(const Key("createtask-page"));
          final elevateButtonSaveTask = find.byKey(
            const Key("elevateButtonSaveTask"),
          );
          final updateTask = find.byKey(
            const Key("updateTask"),
          );
          final updateTaskButton = find.byKey(
            const Key("updateTaskButton"),
          );
          final title = find.byKey(const Key("title"));
          final description = find.byKey(
            const Key("description"),
          );
          final goTodetails = find.byKey(
            const Key("goTodetails"),
          );

          await widgetTester.enterText(email, "admin@gmail.com");
          await widgetTester.enterText(password, "123123123");
          await widgetTester.pump();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.tap(buttom);
          await widgetTester.pumpAndSettle();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.tap(createTask);
          await widgetTester.pumpAndSettle();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.enterText(title, "Lorem Lorem");
          await widgetTester.enterText(description, loremText);
          await widgetTester.pump();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.tap(elevateButtonSaveTask);
          await widgetTester.pumpAndSettle();

          await widgetTester.tap(goTodetails);
          await widgetTester.pumpAndSettle();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.tap(updateTask);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(title, "Programação");
          await widgetTester.enterText(description, loremText);
          await widgetTester.pump();

          await widgetTester.pump(
            const Duration(seconds: 3),
          );
          await widgetTester.tap(updateTaskButton);
          await widgetTester.pumpAndSettle();

          await widgetTester.pump(
            const Duration(seconds: 5),
          );
        },
      );
    },
  );
}
