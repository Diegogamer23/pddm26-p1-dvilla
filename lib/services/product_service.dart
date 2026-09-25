import 'package:primer_parcial/models/producto.dart';

class ProductService {
  Future<List<Producto>> obtenerProductos() async {

    await Future.delayed(const Duration(milliseconds: 800));

    final List<Map<String, dynamic>> catalogoFlores = [
      {
        'id': 1,
        'nombre': 'Ramo Rosas Rojas',
        'precio': 480.0,
        'imagenUrl': '',
      },
      {
        'id': 2,
        'nombre': 'Orquídea Blanca',
        'precio': 650.0,
        'imagenUrl': '',
      },
      {
        'id': 3,
        'nombre': 'Girasoles Frescos',
        'precio': 390.0,
        'imagenUrl': '',
      },
      {
        'id': 4,
        'nombre': 'Caja Tulipanes',
        'precio': 540.0,
        'imagenUrl': '',
      },
      {
        'id': 5,
        'nombre': 'Terrario Suculentas',
        'precio': 290.0,
      },
      {
        'id': 6,
        'nombre': 'Ramo Primaveral',
        'precio': 420.0,
      },
      {
        'id': 7,
        'nombre': 'Peonías Rosas',
        'precio': 580.0,
      },
      {
        'id': 8,
        'nombre': 'Lirio de la Paz',
        'precio': 340.0,
      },
      {
        'id': 9,
        'nombre': 'Canasta Lavanda',
        'precio': 310.0,
      },
      {
        'id': 10,
        'nombre': 'Bonsái Ficus',
        'precio': 720.0,
      },
    ];

    return catalogoFlores.map((json) => Producto.fromJson(json)).toList();
  }
}