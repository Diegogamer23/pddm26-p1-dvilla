
class Producto {
  final int id;
  final String nombre;
  final double precio;
  final String categoria;
  final String imagenUrl;
  
  const Producto ({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.imagenUrl,
  }); 
   //este es el constructorde la clase procucto

factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['title'],
      precio: (json['price']as num ).toDouble(),
      categoria: json['category'],
      imagenUrl: json['thumbnail'],
    );
  }
}