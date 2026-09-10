import 'package:flutter/material.dart';

class ImplementasiLayoutProfilKompleks extends StatefulWidget {
  const ImplementasiLayoutProfilKompleks({Key? key}) : super(key: key);

  @override
  State<ImplementasiLayoutProfilKompleks> createState() =>
      _ImplementasiLayoutProfilKompleksState();
}

class _ImplementasiLayoutProfilKompleksState
    extends State<ImplementasiLayoutProfilKompleks> {
  // State Variables
  bool _isFavorite = false;
  String _selectedPackage = 'Basic Strip Package';
  int _selectedPrice = 35000;
  String _selectedFrame = 'Vintage Ribbon';
  String _selectedPaymentMethod = 'QRIS';

  // Map Harga Paket
  final Map<String, int> _packagePrices = {
    'Basic Strip Package': 35000,
    'Sweet Couple Session': 50000,
    'Party Group Package': 85000,
  };

  // Helper 1: Card Statistik
  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFB5838D).withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A2E35),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFB5838D),
            ),
          ),
        ],
      ),
    );
  }

  // Helper 2: Card Preview Frame
  Widget _buildPhotoCard(String title, IconData icon) {
    final bool isSelected = _selectedFrame == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFrame = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 120,
        height: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB5838D) : const Color(0xFFFFF9F5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFB5838D),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFB5838D).withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
              color: isSelected ? Colors.white : const Color(0xFFB5838D),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF4A2E35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper 3: Card Paket Layanan
  Widget _buildPackageCard(String title, String priceText, String description) {
    final bool isSelected = _selectedPackage == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackage = title;
          _selectedPrice = _packagePrices[title] ?? 35000;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF4EAD4) : const Color(0xFFFFF9F5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4A2E35) : const Color(0xFFB5838D).withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFB5838D).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check_circle_rounded : Icons.photo_library_rounded,
                color: isSelected ? const Color(0xFF4A2E35) : const Color(0xFFB5838D),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A2E35),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB5838D),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              priceText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A2E35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modal Pembayaran
  void _showBookingFlow() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ringkasan Pesanan 🎀',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A2E35),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Paket Foto:', style: TextStyle(color: Colors.grey)),
                      Text(_selectedPackage, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pilihan Frame:', style: TextStyle(color: Colors.grey)),
                      Text(_selectedFrame, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Biaya:', style: TextStyle(color: Colors.grey)),
                      Text(
                        'Rp ${_selectedPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedPaymentMethod,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      fillColor: const Color(0xFFFFF9F5),
                      filled: true,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'QRIS', child: Text('QRIS (BCA, GoPay, OVO, ShopeePay)')),
                      DropdownMenuItem(value: 'BCA Virtual Account', child: Text('BCA Virtual Account')),
                      DropdownMenuItem(value: 'Mandiri VA', child: Text('Mandiri Virtual Account')),
                    ],
                    onChanged: (value) {
                      setModalState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB5838D),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _showETicketDialog();
                      },
                      child: const Text('Bayar Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Dialog E-Ticket
  void _showETicketDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.green, size: 60),
              const SizedBox(height: 12),
              const Text(
                'Pembayaran Berhasil! 🎉',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tunjukkan E-Ticket ini saat tiba di studio Memoire.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF6F0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFB5838D).withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.qr_code_2_rounded, size: 100, color: Color(0xFF4A2E35)),
                    const SizedBox(height: 8),
                    const Text('Kode Booking: #MMR-88219', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const Divider(height: 16),
                    Text('Paket: $_selectedPackage', style: const TextStyle(fontSize: 12)),
                    Text('Frame: $_selectedFrame', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB5838D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      appBar: AppBar(
        title: const Text(
          'Detail Merchant',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB5838D),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xFF4A2E35),
                  content: Text(_isFavorite ? '❤️ Ditambahkan ke Favorit!' : '💔 Dihapus dari Favorit'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Column(
                children: [
                  Text(
                    '🎀 MEMOIRE',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '"A little booth for your little moments."',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Color(0xFFB5838D)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Email Interaktif
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xFF4A2E35),
                      content: Text('📧 Membuka aplikasi email...'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB5838D),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'memoire.photobooth@gmail.com',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Telepon & Lokasi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF4A2E35),
                          content: Text('📞 Memanggil 0812-1907-4885...'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.phone, color: Color(0xFFB0C4B1), size: 20),
                        SizedBox(width: 8),
                        Text('0812-1907-4885', style: TextStyle(color: Color(0xFF4A2E35), fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF4A2E35),
                          content: Text('📍 Membuka peta lokasi Memoire...'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: Color(0xFFB5838D)),
                        SizedBox(width: 8),
                        Text('Jakarta, Indonesia', style: TextStyle(color: Color(0xFF4A2E35), fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Statistik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(child: _buildStatCard('1,200+', 'strips printed')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildStatCard('4.9 / 5.0 ⭐', 'happy memories')),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Deskripsi Naratif
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Memoire adalah studio photobooth estetik berkonsep vintage warmth. Kami menghadirkan ruang cetak foto beraneka frame lucu, pencahayaan lembut, dan aksesori unik untuk mengabadikan momen berharga kamu bersama orang tersayang.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF4A2E35)),
              ),
            ),

            const SizedBox(height: 24),

            // Pilih Paket
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choice Packages 🎀',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildPackageCard('Basic Strip Package', 'Rp 35.000', '2 Photostrips + Digital Softcopy'),
                  _buildPackageCard('Sweet Couple Session', 'Rp 50.000', '4 Photostrips + Animated GIF'),
                  _buildPackageCard('Party Group Package', 'Rp 85.000', '6 Photostrips + All Digital Files'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Pilih Frame
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sample Frame & Strips 📸',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A2E35)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildPhotoCard('Vintage Ribbon', Icons.filter_1_rounded),
                  _buildPhotoCard('Soft Pastel', Icons.filter_2_rounded),
                  _buildPhotoCard('Classic B&W', Icons.filter_3_rounded),
                  _buildPhotoCard('Y2K Glossy', Icons.filter_4_rounded),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Tombol Utama Booking
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _showBookingFlow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB5838D),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  icon: const Icon(Icons.calendar_today_rounded, color: Colors.white),
                  label: Text(
                    'Book ($_selectedPackage)',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}