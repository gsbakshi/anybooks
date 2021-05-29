import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';

class FavoriteDB {
  final path = Directory.current.path + '/favorites.db';

  //Insertion
  add(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    db.insert(item);
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    int val = await db.remove(item);
    await db.close();
    return val;
  }

  Future<List> listAll() async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find({});
    await db.close();
    return val;
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find(item);
    await db.close();
    return val;
  }
}
