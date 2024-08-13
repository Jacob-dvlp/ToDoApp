import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final emailField = find.byValueKey("email-field");
  final passwordField = find.byValueKey("password-field");
  final signInButton = find.text("Sign In");
  final userInfoPage = find.byType("UserInfoPage");
  final snackbar = find.byType("SnackBar");
  group(
    "Integration Teste",
    () {
      FlutterDriver? driver;
      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver!.close();
        }
      });
      test(
          "login fails with incorrect email and password, provides snackbar feedback",
          () async {
        await driver!.tap(emailField);
        await driver!.enterText("test@testmail.com");
        await driver!.tap(passwordField);
        await driver!.enterText("test");
        await driver!.tap(signInButton);
        await driver!.waitFor(snackbar);
        await driver!.waitUntilNoTransientCallbacks();
        assert(userInfoPage == null);
      });
    },
  );
}
