import 'package:flutter/material.dart';

class TugasLayouting extends StatelessWidget {
  const TugasLayouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Text(
                    'Luminous News',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/news.png'),
                  ),
                ],
              ),
              SizedBox(height: 25),

              Row(
                children: [
                  Icon(Icons.circle, size: 8),
                  SizedBox(width: 8),
                  Text('Innovation'),
                ],
              ),
              SizedBox(height: 15),

              Text(
                'Masa Depan Energi Terbarukan: Inovasi EcoSync di Tahun 2024',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 5),
                  Text('24 Mei 2024'),
                  SizedBox(width: 5),
                  Text('•'),
                  SizedBox(width: 5),
                  Text('Oleh Adrin EcoSync'),
                ],
              ),
              SizedBox(height: 20),

              Image.asset(
                'assets/images/news.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              Text(
                'Teknologi rumah pintar terus berkembang pesat, membawa efisiensi energi ke tingkat yang belum pernah terbayangkan sebelumnya...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}