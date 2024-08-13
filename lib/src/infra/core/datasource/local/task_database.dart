import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/app_constants.dart';

class TaskDatabase {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    return await initializeDatabaseUser();
  }

  Future<Database> initializeDatabaseUser() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "task.db");
    var database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(AppConstants.taskTable);
    });
    return database;
  }
}
