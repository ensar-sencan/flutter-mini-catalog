import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String _baseUrl = 'https://wantapi.com';
  static const String _productsEndpoint = '/products.php';
  static const String bannerUrl = '$_baseUrl/assets/banner.png';

  // Fallback mock data eğer API erişilemezse
  static final List<Map<String, dynamic>> _mockProducts = [
    {
      'id': 1,
      'name': 'iPhone 15 Pro',
      'description':
          'Apple\'ın en güçlü akıllı telefonu. A17 Pro çip, titanyum tasarım ve gelişmiş kamera sistemi ile donatılmıştır.',
      'price': 49999.0,
      'image': 'https://via.placeholder.com/300x300?text=iPhone+15+Pro',
      'category': 'Telefon',
      'rating': 4.8,
    },
    {
      'id': 2,
      'name': 'MacBook Pro 14"',
      'description':
          'M3 Pro çipli MacBook Pro. Profesyonel kullanıcılar için tasarlanmış güçlü dizüstü bilgisayar.',
      'price': 89999.0,
      'image': 'https://via.placeholder.com/300x300?text=MacBook+Pro',
      'category': 'Bilgisayar',
      'rating': 4.9,
    },
    {
      'id': 3,
      'name': 'iPad Air',
      'description':
          'M1 çipli iPad Air. İnce tasarımı ve güçlü performansıyla hem iş hem eğlence için idealdir.',
      'price': 29999.0,
      'image': 'https://via.placeholder.com/300x300?text=iPad+Air',
      'category': 'Tablet',
      'rating': 4.7,
    },
    {
      'id': 4,
      'name': 'AirPods Pro',
      'description':
          'Aktif gürültü engelleme özellikli AirPods Pro. Üstün ses kalitesi ve şeffaflık modu ile benzersiz dinleme deneyimi.',
      'price': 9999.0,
      'image': 'https://via.placeholder.com/300x300?text=AirPods+Pro',
      'category': 'Aksesuar',
      'rating': 4.6,
    },
    {
      'id': 5,
      'name': 'HomePod Mini',
      'description':
          'Kompakt ama güçlü HomePod Mini. Odanızı 360 derece yüksek kaliteli sesle doldurun.',
      'price': 7999.0,
      'image': 'https://via.placeholder.com/300x300?text=HomePod+Mini',
      'category': 'Aksesuar',
      'rating': 4.5,
    },
    {
      'id': 6,
      'name': 'Apple Watch Series 9',
      'description':
          'S9 çipli Apple Watch. Gelişmiş sağlık takibi ve Double Tap özelliğiyle hayatınızı kolaylaştırır.',
      'price': 19999.0,
      'image': 'https://via.placeholder.com/300x300?text=Apple+Watch',
      'category': 'Aksesuar',
      'rating': 4.7,
    },
  ];

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl$_productsEndpoint'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final dynamic decoded = jsonDecode(response.body);
        List<dynamic> data;

        if (decoded is List) {
          data = decoded;
        } else if (decoded is Map && decoded.containsKey('products')) {
          data = decoded['products'];
        } else if (decoded is Map && decoded.containsKey('data')) {
          data = decoded['data'];
        } else {
          data = _mockProducts;
        }

        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        return _mockProducts.map((json) => Product.fromJson(json)).toList();
      }
    } catch (e) {
      // API erişilemiyorsa mock data kullan
      return _mockProducts.map((json) => Product.fromJson(json)).toList();
    }
  }
}
