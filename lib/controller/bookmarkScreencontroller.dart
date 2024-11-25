import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:newsappp/models/Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';

class Bookmarkscreencontroller with ChangeNotifier {
  late Database database;
  List<Map<String, dynamic>> savednews=[];
  

  Future<void> initDb() async {
    if (kIsWeb) {
      // Use sqflite for web
      databaseFactory = databaseFactoryFfiWeb;
    }

    final String path = await getDatabasesPath();
    final String dbPath = join(path, 'bookmark5.db');

    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE Saved (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            image TEXT,
            UNIQUE(title, description) -- Prevent duplicates
          )
          ''',
        );
      },
    );

    print("Database initialized at: $dbPath");
  }

  Future<void> addNewsData(Article selectedarticle) async {
    await database.rawInsert(
      'INSERT OR IGNORE INTO Saved(title, description, image) VALUES(?, ?, ?)',
      [
        selectedarticle.title,
        selectedarticle.description,
        selectedarticle.urlToImage,
      ],
    );
    notifyListeners();
  }

  
  Future<void> getAllNewsData() async {
  savednews = await database.rawQuery('SELECT * FROM Saved');
  log(savednews.toString());
  notifyListeners();
}


  Future<void> removeNewsData(String title) async {
     final normalizedTitle = title.trim();
    await database.rawDelete('DELETE FROM Saved WHERE title = ?', [normalizedTitle]);
     await getAllNewsData();
    notifyListeners();
  }
}


  
// }