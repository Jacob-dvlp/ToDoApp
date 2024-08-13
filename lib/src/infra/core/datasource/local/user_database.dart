import 'databse.dart';

class UserDatabase {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    return await initializeDatabaseUser();
  }

  Future<Database> initializeDatabaseUser() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "user.db");
    var database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(AppConstants.userTable);
    });
    return database;
  }
}
