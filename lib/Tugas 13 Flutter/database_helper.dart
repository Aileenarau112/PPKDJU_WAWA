import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tugas13_data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE catatan_tugas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        judul TEXT NOT NULL,
        deskripsi TEXT NOT NULL
      )
    ''');
  }

  // 1. CREATE (Tambah Data)
  Future<int> insertData(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('catatan_tugas', row);
  }

  // 2. READ (Ambil Semua Data)
  Future<List<Map<String, dynamic>>> readAllData() async {
    final db = await instance.database;
    return await db.query('catatan_tugas', orderBy: 'id DESC');
  }

  // 3. UPDATE (Ubah Data berdasarkan ID)
  Future<int> updateData(Map<String, dynamic> row) async {
    final db = await instance.database;
    int id = row['id'];
    return await db.update(
      'catatan_tugas',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // 4. DELETE (Hapus Data berdasarkan ID)
  Future<int> deleteData(int id) async {
    final db = await instance.database;
    return await db.delete(
      'catatan_tugas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}