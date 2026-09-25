import 'package:dio/dio.dart';
import '../models/productshop_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get(
        'https://fakestoreapi.com/products',
      );

      final List data = response.data;

      return data
          .map((item) => Product.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal mengambil data produk: ${e.message}',
      );
    } catch (e) {
      throw Exception(
        'Terjadi kesalahan: $e',
      );
    }
  }
}