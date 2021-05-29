import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';

class DownloadsDB {
  final path = Directory.current.path + '/downloads.db';

  //Insertion
  add(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    db.insert(item);
    db.cleanup();
    await db.close();
  }

  Future<int> remove(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    int val = await db.remove(item);
    db.cleanup();
    await db.close();
    return val;
  }

  Future removeAllWithId(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find({});
    val.forEach((element) {
      db.remove(element);
    });
    db.cleanup();
    await db.close();
  }

  Future<List> listAll() async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find({});
    db.cleanup();
    await db.close();
    return val;
  }

  Future<List> check(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find(item);
    db.cleanup();
    await db.close();
    return val;
  }

  clear() async {
    final db = ObjectDB(FileSystemStorage(path));
    db.remove({});
  }
}
