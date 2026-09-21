import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/data_registran.dart';

class PenyimpananLokal {
  // Pola Singleton agar instance database hanya satu
  static final PenyimpananLokal _instansi = PenyimpananLokal._internal();
  factory PenyimpananLokal() => _instansi;
  PenyimpananLokal._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _inisialisasiDB('portal_warga.db');
    return _database!;
  }

  Future<Database> _inisialisasiDB(String namaFile) async {
    final jalurDirektori = await getDatabasesPath();
    final jalurLengkap = join(jalurDirektori, namaFile);

    return await openDatabase(
      jalurLengkap,
      version: 1,
      onCreate: (db, versi) async {
        await db.execute('''
          CREATE TABLE tabel_pendaftaran_warga (
            id_unik INTEGER PRIMARY KEY AUTOINCREMENT,
            kolom_nama TEXT,
            kolom_email TEXT,
            kolom_hp TEXT,
            kolom_password TEXT,
            kolom_kota TEXT
          )
        ''');
      },
    );
  }

  // Fungsi Create (Simpan Data)
  Future<int> simpanRegistrasi(DataRegistran data) async {
    final db = await database;
    return await db.insert('tabel_pendaftaran_warga', data.kePeta());
  }

  // Fungsi Read (Ambil Semua Data)
  Future<List<DataRegistran>> ambilSemuaData() async {
    final db = await database;
    final hasilQuery = await db.query('tabel_pendaftaran_warga', orderBy: 'id_unik DESC');
    return hasilQuery.map((peta) => DataRegistran.dariPeta(peta)).toList();
  }
}