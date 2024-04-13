import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kosku/add_kos/present_addkos.dart'; // Mengubah nama impor

class DbHelper {
  static late DbHelper _dbHelper;
  static late Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    _dbHelper = DbHelper._createObject(); // Inisialisasi _dbHelper di sini
    _dbHelper.initDb(); // Initialize the database before returning the instance
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'kos.db'; // Ubah nama file database
    var kosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    _database = kosDatabase; // Set the _database field
    return kosDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE kos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama_kos TEXT, -- Ubah nama kolom
      alamat TEXT, -- Ubah nama kolom
      tanggal_posting TEXT, -- Ubah nama kolom
      harga TEXT, -- Tambah kolom harga
      fasilitas TEXT -- Tambah kolom fasilitas
    )
  ''');
  }

  Future<Database> get database async {
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList =
        await db.query('kos', orderBy: 'nama_kos'); // Ubah nama tabel
    return mapList;
  }

  Future<int> insert(Kos object) async {
    Database db = await this.database;
    Map<String, dynamic> mapWithoutId = object.toMap();
    mapWithoutId.remove('id'); // Hapus kolom 'id' dari peta
    int count = await db.insert('kos', mapWithoutId);
    return count;
  }

  Future<int> update(Kos object) async {
    Database db = await this.database;
    int count = await db.update('kos', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db
        .delete('kos', where: 'id=?', whereArgs: [id]); // Ubah nama tabel
    return count;
  }

  Future<List<Kos>> getKosList() async {
    var kosMapList = await select();
    int count = kosMapList.length;
    List<Kos> kosList = []; // Ubah tipe objek
    for (int i = 0; i < count; i++) {
      kosList.add(Kos.fromMap(kosMapList[i])); // Ubah tipe objek
    }
    return kosList;
  }
}
