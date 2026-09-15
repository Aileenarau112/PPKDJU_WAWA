import 'package:flutter/material.dart';

// 1. Class Model untuk Bagian 3
class ProdukModel {
  final String namaProduk;
  final String deskripsi;
  final IconData iconProduk;
  final int harga;

  ProdukModel({
    required this.namaProduk,
    required this.deskripsi,
    required this.iconProduk,
    required this.harga,
  });
}

class MenampilkandaftarkategoriDenganListviewbuilder extends StatefulWidget {
  const MenampilkandaftarkategoriDenganListviewbuilder({super.key});

  @override
  State<MenampilkandaftarkategoriDenganListviewbuilder> createState() => 
      _MenampilkandaftarkategoriDenganListviewbuilderState();
}

class _MenampilkandaftarkategoriDenganListviewbuilderState 
    extends State<MenampilkandaftarkategoriDenganListviewbuilder> {
  
  int _currentIndex = 0;

  // Warna Khas Millenial Pink
  final Color millenialPink = const Color(0xFFE8ADAA);
  final Color millenialPinkSoft = const Color(0xFFF7EBE8);
  final Color millenialPinkDark = const Color(0xFF8C5856);

  // Data Bagian 1: List<String> (10 Data)
  final List<String> daftarKategoriString = [
    'Skincare & Serum Wajah',
    'Makeup & Kosmetik',
    'Haircare & Vitamin',
    'Body Care & Lotion',
    'Parfum & Fragrance',
    'Tas Selempang Wanita',
    'Sepatu Heels & Flats',
    'Aksesoris & Perhiasan',
    'Outfit & Dress Casual',
    'Hijab & Pashmina',
  ];

  // Data Bagian 2: List<Map<String, dynamic>> (10 Data dengan Ikon)
  final List<Map<String, dynamic>> daftarKategoriMap = [
    {'nama': 'Makeup & Kosmetik', 'icon': Icons.brush},
    {'nama': 'Skincare Wajah', 'icon': Icons.face},
    {'nama': 'Parfum Mewah', 'icon': Icons.local_florist},
    {'nama': 'Tas & Dompet', 'icon': Icons.shopping_bag},
    {'nama': 'Sepatu & Sandals', 'icon': Icons.roller_skating},
    {'nama': 'Perhiasan Emas', 'icon': Icons.diamond},
    {'nama': 'Perawatan Rambut', 'icon': Icons.content_cut},
    {'nama': 'Pakaian Muslimah', 'icon': Icons.checkroom},
    {'nama': 'Kacamata Fashion', 'icon': Icons.visibility},
    {'nama': 'Jam Tangan Wanita', 'icon': Icons.watch},
  ];

  // Data Bagian 3: List<ProdukModel> (Total 22 Produk Lengkap)
  final List<ProdukModel> daftarProdukModel = [
    ProdukModel(
      namaProduk: 'Glowing Serum 20ml',
      deskripsi: 'Serum pencerah wajah dengan ekstrak sakura.',
      iconProduk: Icons.water_drop,
      harga: 125000,
    ),
    ProdukModel(
      namaProduk: 'Matte Lipstick Velvet',
      deskripsi: 'Lipstik tahan lama yang ringan di bibir.',
      iconProduk: Icons.brush,
      harga: 85000,
    ),
    ProdukModel(
      namaProduk: 'Tas Selempang Kulit',
      deskripsi: 'Tas elegan cocok untuk acara formal & casual.',
      iconProduk: Icons.shopping_bag,
      harga: 299000,
    ),
    ProdukModel(
      namaProduk: 'Parfum Floral Elegance',
      deskripsi: 'Wangi tahan 12 jam dengan sentuhan melati.',
      iconProduk: Icons.local_florist,
      harga: 175000,
    ),
    ProdukModel(
      namaProduk: 'Sunscreen SPF 50+',
      deskripsi: 'Perlindungan maksimal dari sinar UV matahari.',
      iconProduk: Icons.wb_sunny,
      harga: 95000,
    ),
    ProdukModel(
      namaProduk: 'Hijab Pashmina Silk',
      deskripsi: 'Bahan lembut, mudah dibentuk, tidak licin.',
      iconProduk: Icons.checkroom,
      harga: 65000,
    ),
    ProdukModel(
      namaProduk: 'Eyeshadow Palette Nude',
      deskripsi: '12 warna pilihan untuk makeup natural.',
      iconProduk: Icons.palette,
      harga: 140000,
    ),
    ProdukModel(
      namaProduk: 'Heels Minimalist 5cm',
      deskripsi: 'Sepatu hak tinggi nyaman dipakai seharian.',
      iconProduk: Icons.girl,
      harga: 250000,
    ),
    ProdukModel(
      namaProduk: 'Body Lotion Whitening',
      deskripsi: 'Melembapkan kulit dan mencerahkan seketika.',
      iconProduk: Icons.spa,
      harga: 75000,
    ),
    ProdukModel(
      namaProduk: 'Skincare Sheet Mask Set',
      deskripsi: 'Isi 5 masker wajah nutrisi instan.',
      iconProduk: Icons.medical_services,
      harga: 50000,
    ),
    ProdukModel(
      namaProduk: 'Nail Polish Pastel Series',
      deskripsi: 'Kuteks halal cepat kering dengan warna lembut.',
      iconProduk: Icons.color_lens,
      harga: 45000,
    ),
    ProdukModel(
      namaProduk: 'Eyebrow Pencil Pro',
      deskripsi: 'Pensil alis otomatis tahan air dan natural.',
      iconProduk: Icons.create,
      harga: 60000,
    ),
    ProdukModel(
      namaProduk: 'Face Mist Hydrating',
      deskripsi: 'Penyegar wajah seketika untuk kulit glowing.',
      iconProduk: Icons.air,
      harga: 90000,
    ),
    ProdukModel(
      namaProduk: 'Mascara Waterproof',
      deskripsi: 'Membuat bulu mata lentik natural seharian.',
      iconProduk: Icons.visibility,
      harga: 88000,
    ),
    ProdukModel(
      namaProduk: 'Blush On Peach Glow',
      deskripsi: 'Perona pipi bertekstur halus dan tahan lama.',
      iconProduk: Icons.star,
      harga: 70000,
    ),
    ProdukModel(
      namaProduk: 'Micellar Water 300ml',
      deskripsi: 'Pembersih makeup sekaligus melembapkan.',
      iconProduk: Icons.cleaning_services,
      harga: 65000,
    ),
    ProdukModel(
      namaProduk: 'Hair Vitamin Capsule',
      deskripsi: 'Menutrisi rambut rusak dan bercabang.',
      iconProduk: Icons.bolt,
      harga: 55000,
    ),
    ProdukModel(
      namaProduk: 'Pouch Organizer Makeup',
      deskripsi: 'Tas kecil praktis untuk perlengkapan kosmetik.',
      iconProduk: Icons.card_travel,
      harga: 45000,
    ),
    ProdukModel(
      namaProduk: 'Flat Shoes Ribbon',
      deskripsi: 'Sepatu teplek santai dengan aksen pita manis.',
      iconProduk: Icons.shopping_bag_outlined,
      harga: 160000,
    ),
    ProdukModel(
      namaProduk: 'Gold Bracelet Minimalist',
      deskripsi: 'Gelang tangan lapis emas desain modern.',
      iconProduk: Icons.diamond_outlined,
      harga: 120000,
    ),
    ProdukModel(
      namaProduk: 'Body Scrub Kopi',
      deskripsi: 'Mengangkat sel kulit mati agar lebih halus.',
      iconProduk: Icons.coffee,
      harga: 80000,
    ),
    ProdukModel(
      namaProduk: 'Sleeping Mask Centella',
      deskripsi: 'Merawat skin barrier wajah saat tidur malam.',
      iconProduk: Icons.nightlight_round,
      harga: 110000,
    ),
  ];

  // Tampilan Bagian 1: List<String>
  Widget _buildBagianSatu() {
    return ListView.builder(
      itemCount: daftarKategoriString.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.5,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: millenialPinkSoft,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: millenialPinkDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              daftarKategoriString[index],
              style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF4A4A4A)),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 14, color: millenialPinkDark),
          ),
        );
      },
    );
  }

  // Tampilan Bagian 2: List<Map> dengan Ikon
  Widget _buildBagianDua() {
    return ListView.builder(
      itemCount: daftarKategoriMap.length,
      itemBuilder: (context, index) {
        final item = daftarKategoriMap[index];
        return Card(
          elevation: 0.5,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(
              item['icon'],
              color: millenialPinkDark,
              size: 26,
            ),
            title: Text(
              item['nama'],
              style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF4A4A4A)),
            ),
            subtitle: Text(
              'Koleksi pilihan terbaik ke-${index + 1}',
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ),
        );
      },
    );
  }

  // Tampilan Bagian 3: Model OOP dengan Ikon & Deskripsi
  Widget _buildBagianTiga() {
    return ListView.builder(
      itemCount: daftarProdukModel.length,
      itemBuilder: (context, index) {
        final produk = daftarProdukModel[index];
        return Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: millenialPinkSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                produk.iconProduk,
                color: millenialPinkDark,
                size: 30,
              ),
            ),
            title: Text(
              produk.namaProduk,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF333333)),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  produk.deskripsi,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 6),
                Text(
                  'Rp ${produk.harga}',
                  style: TextStyle(
                    color: millenialPinkDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> judulApp = [
      '1. List String',
      '2. List Map & Ikon',
      '3. Model Produk (OOP)',
    ];

    final List<Widget> halamanWidget = [
      _buildBagianSatu(),
      _buildBagianDua(),
      _buildBagianTiga(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F7),
      appBar: AppBar(
        title: Text(judulApp[_currentIndex]),
        backgroundColor: millenialPink,
        foregroundColor: const Color(0xFF4A3B3A),
        elevation: 0,
      ),
      body: halamanWidget[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: millenialPinkDark,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Bagian 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Bagian 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bagian 3',
          ),
        ],
      ),
    );
  }
}