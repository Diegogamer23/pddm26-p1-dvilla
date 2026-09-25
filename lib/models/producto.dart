class Producto {
  final int id;
  final String nombre;
  final double precio;
  final String imagenUrl;

  const Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagenUrl,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'] as int? ?? 0,
      nombre: json['nombre'] ?? json['title'] ?? 'Flor',
      precio: (json['precio'] ?? json['price'] as num?)?.toDouble() ?? 0.0,
      imagenUrl: json['imagenUrl'] ?? json['thumbnail'] ?? '',
    );
  }
}