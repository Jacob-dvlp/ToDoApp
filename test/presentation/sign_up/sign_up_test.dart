import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/services/locator.dart';
import 'package:todo_app/src/services/locator_service.dart';

void main() {
  setUpAll(() async {
    setupFirebaseCoreMocks();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    setupLocator();
  });
  group(
    "Bloc",
    () {
      testWidgets(
        "It should return an error message stating that empty fields are not allowed",
        (widgetTester) async {
          WidgetsFlutterBinding.ensureInitialized();
          await widgetTester.pumpWidget(
            BlocProvider<SignUpCubit>(
              create: (context) => locator.get<SignUpCubit>(),
              child: const MaterialApp(
                home: SignUpPage(),
              ),
            ),
          );

          final buttom = find.byKey(const Key("elevatedButton-sign-up"));

          await widgetTester.tap(buttom);

          await widgetTester.pumpAndSettle();

          expect(find.text("Campos vazios não são permetidos"), findsOneWidget);
        },
      );

      testWidgets(
        "It should return a warning stating that the password provided is too weak.",
        (widgetTester) async {
          WidgetsFlutterBinding.ensureInitialized();
          await widgetTester.pumpWidget(
            BlocProvider<SignUpCubit>(
              create: (context) => locator.get<SignUpCubit>(),
              child: const MaterialApp(
                home: SignUpPage(),
              ),
            ),
          );

          final email = find.byKey(const Key("email-field-sign-up"));
          await widgetTester.tap(email);
          final password = find.byKey(const Key("password-field-sign-up"));
          await widgetTester.tap(password);

          await widgetTester.enterText(email, "admin@gmail.com");
          await widgetTester.tap(email);

          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(password, "");
          await widgetTester.pumpAndSettle();

          final buttom = find.byKey(const Key("password-field-sign-up"));
          await widgetTester.tap(buttom);
          await widgetTester.pumpAndSettle();

          expect(find.text("Email inválido ou senha"), findsNothing);
        },
      );
    },
  );
}
