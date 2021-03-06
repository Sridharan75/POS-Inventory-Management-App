import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE grm(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        batchNo TEXT NOT NULL,
        date DATE,
        billNo TEXT NOT NULL,
        billDate DATE,
        dueDate DATE,
        paymentType TEXT,
        comments TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'inventory.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }


  // Create new item (journal)
  static Future<int> createItem(String batchNo,String date,String billNo,String billDate,String dueDate,String paymentType,String comments) async {
    final db = await DBHelper.db();

    final data = {'batchNo':batchNo, 'date':date,'billNo':billNo, 'billDate':billDate, 'dueDate':dueDate, 'paymentType':paymentType, 'comments':comments};
    final id = await db.insert('grm', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('grm', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();
    return db.query('grm', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String batchNo,String date,String billNo,String billDate,String dueDate,String paymentType,String comments) async {
    final db = await DBHelper.db();

    final data = {
      'batchNo':batchNo, 'date':date,'billNo':billNo, 'billDate':billDate, 'dueDate':dueDate, 'paymentType':paymentType, 'comments':comments,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('grm', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete("grm", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}