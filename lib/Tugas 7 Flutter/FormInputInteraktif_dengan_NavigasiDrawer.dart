import 'package:flutter/material.dart';

// Enum menu khusus tema Ars Store & Personalisasi Akun
enum MenuPreferensi { syaratKetentuan, darkMode, kategoriProduk, tanggalLahir, aturPengingat }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ars Store',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ForminputinteraktifDenganNavigasidrawer(),
    );
  }
}

class ForminputinteraktifDenganNavigasidrawer extends StatefulWidget {
  const ForminputinteraktifDenganNavigasidrawer({super.key});

  @override
  State<ForminputinteraktifDenganNavigasidrawer> createState() => 
      _ForminputinteraktifDenganNavigasidrawerState();
}

class _ForminputinteraktifDenganNavigasidrawerState extends State<ForminputinteraktifDenganNavigasidrawer> {
  // Variabel melacak menu aktif di drawer
  MenuPreferensi _menuAktif = MenuPreferensi.syaratKetentuan;

  // Variabel status input tugas
  bool _syaratDisetujui = false;
  bool _isDarkMode = false;
  String _kategoriPilihan = "Elektronik"; 
  DateTime? _tanggalLahir;
  TimeOfDay? _waktuPengingat;

  // Daftar kategori produk sesuai instruksi tugas
  final List<String> _daftarKategori = ["Elektronik", "Pakaian", "Makanan", "Lainnya"];

  @override
  Widget build(BuildContext context) {
    bool isDark = _isDarkMode && _menuAktif == MenuPreferensi.darkMode;

    return Scaffold(
      appBar: AppBar(
        // WARNA KONTRAS: AppBar dibuat biru solid dengan teks putih
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        title: Text(
          "Ars Store: ${_getJudulAppBar()}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 4,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                // Menggunakan gradasi biru yang lebih pekat dan dinamis
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.cyan.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.storefront, color: Colors.blue),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Ars Store',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Preferensi Belanja & Akun',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(MenuPreferensi.syaratKetentuan, Icons.check_box_outlined, 'Syarat & Ketentuan'),
            _buildDrawerItem(MenuPreferensi.darkMode, Icons.dark_mode_outlined, 'Mode Gelap'),
            _buildDrawerItem(MenuPreferensi.kategoriProduk, Icons.category_outlined, 'Pilih Kategori Produk'),
            _buildDrawerItem(MenuPreferensi.tanggalLahir, Icons.cake_outlined, 'Pilih Tanggal Lahir'),
            _buildDrawerItem(MenuPreferensi.aturPengingat, Icons.alarm_outlined, 'Atur Pengingat'),
          ],
        ),
      ),
      body: Container(
        color: isDark ? const Color(0xFF121212) : const Color(0xFFF4F7FB),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildFormContent(isDark)),
            const SizedBox(height: 12),
            _buildHasilPilihan(isDark),
          ],
        ),
      ),
    );
  }

  // Widget pembantu item Drawer dengan efek seleksi yang kontras
  Widget _buildDrawerItem(MenuPreferensi menu, IconData icon, String title) {
    bool isSelected = _menuAktif == menu;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue.shade700 : Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.blue.shade700 : Colors.black87,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {
        setState(() => _menuAktif = menu);
        Navigator.pop(context);
      },
    );
  }

  String _getJudulAppBar() {
    switch (_menuAktif) {
      case MenuPreferensi.syaratKetentuan: return "Syarat & Ketentuan";
      case MenuPreferensi.darkMode: return "Mode Gelap";
      case MenuPreferensi.kategoriProduk: return "Kategori Produk";
      case MenuPreferensi.tanggalLahir: return "Tanggal Lahir";
      case MenuPreferensi.aturPengingat: return "Atur Pengingat";
    }
  }

  Widget _buildFormContent(bool isDark) {
    Color textColor = isDark ? Colors.white : Colors.black87;
    Widget formWidget;

    switch (_menuAktif) {
      case MenuPreferensi.syaratKetentuan:
        formWidget = CheckboxListTile(
          title: Text("Saya menyetujui semua persyaratan ketentuan member", style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
          value: _syaratDisetujui,
          activeColor: Colors.blue.shade700,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onChanged: (val) => setState(() => _syaratDisetujui = val ?? false),
        );
        break;

      case MenuPreferensi.darkMode:
        formWidget = SwitchListTile(
          title: Text("Aktifkan Mode Gelap", style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
          value: _isDarkMode,
          activeThumbColor: Colors.blue.shade700,
          onChanged: (val) => setState(() => _isDarkMode = val),
        );
        break;

      case MenuPreferensi.kategoriProduk:
        formWidget = DropdownButtonFormField<String>(
          initialValue: _kategoriPilihan,
          dropdownColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          style: TextStyle(color: textColor, fontSize: 16),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            labelText: 'Kategori Produk Favorit',
            prefixIcon: Icon(Icons.category, color: Colors.blue.shade700),
          ),
          items: _daftarKategori.map((kat) => DropdownMenuItem(value: kat, child: Text(kat, style: TextStyle(color: textColor)))).toList(),
          onChanged: (val) => setState(() => _kategoriPilihan = val!),
        );
        break;

      case MenuPreferensi.tanggalLahir:
        formWidget = Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime(2000, 1, 1),
                firstDate: DateTime(1940),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => _tanggalLahir = picked);
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text("Pilih Tanggal Lahir (Diskon Ulang Tahun)", style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        );
        break;

      case MenuPreferensi.aturPengingat:
        formWidget = Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: () async {
              TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) setState(() => _waktuPengingat = picked);
            },
            icon: const Icon(Icons.alarm),
            label: const Text("Atur Pengingat Flash Sale", style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        );
        break;
    }

    return Card(
      elevation: 4,
      shadowColor: Colors.blue.withValues(alpha: 0.2),
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _getJudulAppBar(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.blue.shade800),
            ),
            const SizedBox(height: 16),
            formWidget,
          ],
        ),
      ),
    );
  }

  // Widget kartu status di bagian bawah dengan bayangan
  Widget _buildHasilPilihan(bool isDark) {
    String strTanggal = _tanggalLahir == null 
        ? "Belum dipilih" 
        : "${_tanggalLahir!.day} ${_namaBulan(_tanggalLahir!.month)} ${_tanggalLahir!.year}";
    
    String strWaktu = _formatWaktu(_waktuPengingat);

    return Card(
      elevation: 3,
      shadowColor: Colors.blue.withValues(alpha: 0.15),
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, size: 20, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                Text(
                  "Status Terkini Preferensi Anda:", 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDark ? Colors.white : Colors.black87),
                ),
              ],
            ),
            const Divider(height: 16),
            _buildStatusRow("Checkbox", _syaratDisetujui ? "Syarat disetujui" : "Belum disetujui", isDark),
            _buildStatusRow("Switch", _isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif", isDark),
            _buildStatusRow("Dropdown", "Kategori pilihan: $_kategoriPilihan", isDark),
            _buildStatusRow("Tanggal Lahir", "Tanggal Lahir: $strTanggal", isDark),
            _buildStatusRow("Pengingat", "Pengingat Flash Sale: $strWaktu", isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Text(
        "• $label: $value", 
        style: TextStyle(fontSize: 13, color: isDark ? Colors.white70 : Colors.black54),
      ),
    );
  }

  String _formatWaktu(TimeOfDay? time) {
    if (time == null) return "Belum diatur";
    final int h = time.hour;
    final int m = time.minute;
    String period = h >= 12 ? "PM" : "AM";
    int h12 = h % 12;
    if (h12 == 0) h12 = 12;
    return "${h12.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')} $period";
  }

  String _namaBulan(int m) {
    const bulan = ["", "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
    return bulan[m];
  }
}