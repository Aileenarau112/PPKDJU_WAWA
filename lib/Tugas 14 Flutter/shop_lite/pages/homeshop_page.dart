import 'package:flutter/material.dart';
import '../services/apishop_service.dart';
import '../models/productshop_model.dart';
import '../widgets/productshop_card.dart';

class HomeShopPage extends StatefulWidget {
  const HomeShopPage({super.key});

  @override
  State<HomeShopPage> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShopPage> {
  final ApiService apiService = ApiService();

  late Future<List<Product>> productList;

  @override
  void initState() {
    super.initState();

    productList = apiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopLite'),
        centerTitle: true,
      ),

      body: FutureBuilder<List<Product>>(
        future: productList,
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Gagal mengambil data produk',
              ),
            );
          }

          // Data berhasil tetapi kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Data produk kosong',
              ),
            );
          }

          // Data berhasil
          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductShopCard(
                product: products[index],
              );
            },
          );
        },
      ),
    );
  }
}