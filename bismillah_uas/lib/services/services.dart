import 'package:bismillah_uas/models/product.dart';
import 'package:dio/dio.dart';

class Service {
  static Future<List<Product>> fetchProducts() async {
    Response response = await Dio().get("http://192.168.0.120:3000/product");
    List<Product> products =
        (response.data as List).map((v) => Product.fromJSON(v)).toList();
    return products;
  }

  static Future<List<Product>> fetchProductsBasedOnType(String status) async {
    Response response =
        await Dio().get("http://192.168.0.120:3000/product?status=" + status);
    List<Product> products =
        (response.data as List).map((v) => Product.fromJSON(v)).toList();
    return products;
  }

  static void addProduct(
      String title, harga, person, start_bid, status, image, desc) async {
    try {
      Response response =
          await Dio().post("http://192.168.0.120:3000/product", data: {
        'title': title,
        'harga': harga,
        'person': person,
        'start_bid': start_bid,
        'status': status,
        'image': image,
        'deskripsi': desc
      });
      if (response.data.length > 0) {
        print("Add product success");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
