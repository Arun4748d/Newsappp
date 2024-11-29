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
    final String dbPath = join(path, 'bookmark7.db');

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
            url TEXT,
            content TEXT,
            author TEXT,
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
      'INSERT OR IGNORE INTO Saved(title, description, image, url, content, author) VALUES(?, ?, ?, ?, ?, ?)',
      [
        selectedarticle.title,
        selectedarticle.description,
        selectedarticle.urlToImage,
        selectedarticle.url,
        selectedarticle.content,
        selectedarticle.author,
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
  // Fetch the 'id' of the record you want to delete by title
  final result = await database.rawQuery('SELECT id FROM Saved WHERE title = ?', [title]);
  
  if (result.isNotEmpty) {
    // If a matching title is found, delete by id
    final id = result[0]['id']; // Get the id of the record
    
    // Perform deletion based on 'id'
    await database.rawDelete('DELETE FROM Saved WHERE id = ?', [id]);

    // Reload the saved news data
    await getAllNewsData();
  } else {
    print("No record found with the given title.");
  }
  notifyListeners();
}

}


  
// }