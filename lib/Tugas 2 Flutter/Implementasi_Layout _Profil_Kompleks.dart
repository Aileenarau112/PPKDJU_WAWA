import 'package:flutter/material.dart';

class ImplementasiLayoutProfilKompleks extends StatelessWidget {
const ImplementasiLayoutProfilKompleks({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      appBar: AppBar(
        title: Text(
          'Detail Merchant',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
          
        centerTitle: true,
        backgroundColor: const Color(0xFFB5838D),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 24),

            Center(
              child: Column(
                children: [
                  Text(
                    '🎀 MEMOIRE',
                    style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A2E35),
                    ),
                  ),
                  
                  SizedBox(height: 28),
                  Text(
                    '"A little booth for your little moments."',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFB5838D),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFB5838D),
                borderRadius: BorderRadius.circular(30),
              ),

              child: Row(
                mainAxisSize:  MainAxisSize.min,
                children: [
                  Icon(Icons.email, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'memoire.photobooth@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Row(
                children: [

                  Icon(
                    Icons.phone,
                    color: Color(0xFFB0C4B1),
                    size: 20,
                  ),

                  SizedBox(width: 8),
                  Text(
                    '0812-1907-4885',
                    style: TextStyle(
                      color: Color(0xFF4A2E35),
                      fontWeight: FontWeight.w500,
                    ), 
                  ),

                  Spacer(),

                  Icon(
                    Icons.location_on,
                    color: Color(0xFFB5838D),
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(width: 8),
                  Text(
                    'Jakarta, Indonesia',
                    style: TextStyle(
                      color: Color(0xFF4A2E35),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFFB5838D).withOpacity(0.3)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '1,200+',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A2E35),
                            ),
                          ),

                          SizedBox(height: 4),
                          Text(
                            'strips printed',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFB5838D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFFB5838D).withOpacity(0.3)),
                      ),

                      child: Column(
                        children: [
                          Text(
                            '4.9 / 5.0 ⭐',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A2E35),
                            ),
                          ),

                          SizedBox(height: 4),
                          Text(
                            'happy memories',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFB5838D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Memoire adalah studio photobooth estetik berkonsep vintage warmth. Kami menghadirkan ruang cetak foto beraneka frame lucu, pencahayaan lembut, dan aksesori unik untuk mengabadikan momen berharga kamu bersama orang tersayang.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Color(0xFF4A2E35),
                ),
              ),
            ),

            SizedBox(height: 24),

            Container(
              height: 180,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Color(0xFFFFF9F5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFB5838D).withOpacity(0.4), width: 1.5)
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/Memoire_Logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Icon(Icons.photo_camera_rounded, size: 40, color: Color(0xFFB5838D)) ,
                         SizedBox(height: 8),
                         Text(
                          '🎀 MEMOIRE PHOTOBOOTH',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A2E35),
                          ),
                         ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 32),

          ],
        ),
      ),
    );
  }
}