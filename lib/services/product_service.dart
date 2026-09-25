import 'dart:convert';

import 'package:primer_parcial/models/producto.dart';
import 'package:http/http.dart' as http;
class ProductService{
  static const String baseUrl = 'https://dummyjson.com/products';

  Future<List<Producto>> obtenerProductos() async {
    final Uri url = Uri.parse(baseUrl);
    final http.Response respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final Map<String, dynamic> datos = jsonDecode(respuesta.body);
      final List<dynamic> listarproductos = datos['products'];

      return listarproductos.map((Productojson) => Producto.fromJson(Productojson)).toList();
    } else {
      throw Exception('Error al obtener los productos');
    }
  }
}
