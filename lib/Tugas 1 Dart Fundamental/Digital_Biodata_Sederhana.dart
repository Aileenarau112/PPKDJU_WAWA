
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DigitalBiodataSederhana(),
    ),
  );
}

class DigitalBiodataSederhana extends StatelessWidget {
  const DigitalBiodataSederhana({super.key});

  @override
  Widget build(BuildContext context) {
    String nama = "Syalwa Khusnulkhotimah Suhartono"; 
    int umur = 24;                          // Tipe int
    double tinggiBadan = 165.5;             // Tipe double
    bool statusAktif = true;                // Tipe bool

    List<String> daftarBuku = ["TereLiye", "Why?"];

    Map<String, String> infoTambahan = {
      "Alamat": "Jakarta",
      "Profesi": "Mahasiswi",
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text('Digital Biodata Anggota', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/hallo.jpeg'),
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              nama,
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),

            buildInfoCard(
              'Informasi Utama', 
              Icons.person_pin_rounded, 
              Colors.deepPurple,
              [
                buildInfoTile(Icons.perm_identity, Colors.deepPurple, 'Nama', nama),
                buildInfoTile(Icons.cake, Colors.pink, 'Umur', '$umur tahun'),
                buildInfoTile(Icons.height, Colors.amber.shade800, 'Tinggi Badan', '$tinggiBadan cm'),
                buildInfoTile(
                  Icons.verified_user_rounded, 
                  statusAktif ? Colors.green : Colors.red, 
                  'Status Aktif', 
                  statusAktif ? 'Aktif' : 'Tidak Aktif'
                ),
              ],
            ),

            const SizedBox(height: 16),

            // --- CARD 2: BUKU FAVORIT ---
            buildInfoCard(
              'Daftar Buku Favorit', 
              Icons.auto_stories_rounded, 
              Colors.orange.shade800,
              [
                ...daftarBuku.map(
                  (buku) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.bookmark, size: 20, color: Colors.orange.shade800),
                          const SizedBox(width: 10),
                          Text(
                            buku, 
                            style: TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // --- CARD 3: INFORMASI TAMBAHAN ---
            buildInfoCard(
              'Informasi Tambahan', 
              Icons.stars_rounded, 
              Colors.teal,
              [
                ...infoTambahan.entries.map(
                  (entry) => buildInfoTile(Icons.check_circle_rounded, Colors.teal, entry.key, entry.value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget buildInfoCard(String title, IconData icon, Color headerColor, List<Widget> children) {
    return Card(
      elevation: 3,
      shadowColor: headerColor.withValues(alpha: 0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: headerColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: headerColor, size: 22),
                ),
                const SizedBox(width: 12),
                Text(
                  title, 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: headerColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: headerColor.withValues(alpha: 0.2), thickness: 1),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, Color iconColor, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 10),
          
          SizedBox(
            width: 100, 
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
          const Text(': ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}