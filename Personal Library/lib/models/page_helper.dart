import 'package:flutter_application_4/models/pages_bojo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class PageHelper {
  static final PageHelper _instance = PageHelper.internal();
  factory PageHelper() => _instance;
  PageHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "pages.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int nawerVersion) async {
      await db.execute(
          "CREATE TABLE $pagestable($idColumn INTEGER PRIMARY KEY,  $materiaColumn TEXT, $titleColumn TEXT, $dataColumn TEXT, $imgColumn TEXT)");
    });
  }

  Future<PagesBojo> savePage(PagesBojo page) async {
    Database? dbPages = await db;
    page.id = await dbPages?.insert(pagestable, page.toMap());
    return page;
  }

  Future<PagesBojo?> getPage(int id) async {
    Database? dbPage = await _db;
    List<Map> maps = await dbPage!.query(pagestable,
        columns: [idColumn, materiaColumn, titleColumn, dataColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return PagesBojo.fromMap(maps.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<int?> deletePage(int id) async {
    Database? dbPages = await db;
    return await dbPages!
        .delete(pagestable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updatePages(PagesBojo page) async {
    Database? dbPages = await db;
    return await dbPages!.update(pagestable, page.toMap(),
        where: "$idColumn = ?", whereArgs: [page.id]);
  }

  Future<List<PagesBojo>> getAllPages() async {
    Database? dbPages = await db;
    List listMap = await dbPages!.rawQuery("SELECT * FROM $pagestable");
    List<PagesBojo> list = [];

    for (Map m in listMap) {
      list.add(PagesBojo.fromMap(m as Map<String, dynamic>));
    }

    return list;
  }

//buscar quantidade de contatos salvos
  Future<int?> getNumber() async {
    Database? dbPages = await db;
    return Sqflite.firstIntValue(
        await dbPages!.rawQuery("SELECT COUNT(*) FROM $pagestable"));
  }

//fechar banco
  Future close() async {
    Database? dbPages = await db;
    dbPages!.close();
  }
}
