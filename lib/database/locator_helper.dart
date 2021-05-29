import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';

class LocatorDB {
  final path = Directory.current.path + '/locator.db';

  //Insertion
  add(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    
    db.insert(item);
    await db.close();
  }

  update(Map item) async {
    final db = ObjectDB(FileSystemStorage(path));
    int update = await db.update({'bookId': item['bookId']}, item);
    if(update == 0){
      db.insert(item);
    }
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

  Future<List> getLocator(String id) async {
    final db = ObjectDB(FileSystemStorage(path));
    List val = await db.find({'bookId': id});
    await db.close();
    return val;
  }
}
