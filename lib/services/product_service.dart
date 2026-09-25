import 'package:primer_parcial/models/producto.dart';

class ProductService {
  Future<List<Producto>> obtenerProductos() async {
    // Simula tiempo de respuesta para apreciar el indicador de carga
    await Future.delayed(const Duration(milliseconds: 800));

    final List<Map<String, dynamic>> catalogoFlores = [
      {
        'id': 1,
        'nombre': 'Ramo Rosas Rojas',
        'precio': 480.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500&q=80',
      },
      {
        'id': 2,
        'nombre': 'Orquídea Blanca',
        'precio': 650.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1525310072745-f49212b5ac6d?w=500&q=80',
      },
      {
        'id': 3,
        'nombre': 'Girasoles Frescos',
        'precio': 390.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1597848212624-a19eb35e2651?w=500&q=80',
      },
      {
        'id': 4,
        'nombre': 'Caja Tulipanes',
        'precio': 540.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1520763185298-1b434c919102?w=500&q=80',
      },
      {
        'id': 5,
        'nombre': 'Terrario Suculentas',
        'precio': 290.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=500&q=80',
      },
      {
        'id': 6,
        'nombre': 'Ramo Primaveral',
        'precio': 420.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=500&q=80',
      },
      {
        'id': 7,
        'nombre': 'Peonías Rosas',
        'precio': 580.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1526047932273-341f2a7631f9?w=500&q=80',
      },
      {
        'id': 8,
        'nombre': 'Lirio de la Paz',
        'precio': 340.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1593482892290-f54927ae1bf6?w=500&q=80',
      },
      {
        'id': 9,
        'nombre': 'Canasta Lavanda',
        'precio': 310.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1528183429752-a97d0bf99b5a?w=500&q=80',
      },
      {
        'id': 10,
        'nombre': 'Bonsái Ficus',
        'precio': 720.0,
        'imagenUrl': 'https://images.unsplash.com/photo-1613143329972-358045e7fcfb?w=500&q=80',
      },
    ];

    return catalogoFlores.map((json) => Producto.fromJson(json)).toList();
  }
}