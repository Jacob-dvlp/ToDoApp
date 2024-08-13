class AppConstants {
  static const String taskTable =
      'CREATE TABLE IF NOT EXISTS task (id INTEGER, title TEXT, date TEXT, description TEXT, isDone TEXT NOT NULL DEFAULT 0 ,PRIMARY KEY("id" AUTOINCREMENT))';

  static const String userTable =
      'CREATE TABLE IF NOT EXISTS user (id INTEGER, email TEXT, token TEXT,PRIMARY KEY("id" AUTOINCREMENT))';

  static const themeStatus = "THEME_STATUS";

  static const String logo = "assets/logo/logotipo.svg";

  static const String createAccount = "Conta criada com Sucesso";

  static const String loginMessage = "Seja bem vindo";
}
