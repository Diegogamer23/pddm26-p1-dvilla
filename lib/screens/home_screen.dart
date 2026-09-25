import 'package:flutter/material.dart';
import 'package:primer_parcial/models/categoria.dart';
import 'package:primer_parcial/models/producto.dart';
import 'package:primer_parcial/widget/categoria_item.dart';
import 'package:primer_parcial/widget/producto_item.dart';
import 'package:primer_parcial/services/product_service.dart';
class HomeScreen extends StatefulWidget {
  //constructor de la clase HomeScreen
  //statful se crea automáticamente cuando se crea un widget que necesita mantener un estado mutable.
  //stateful es para que se pueda cambiar el estado de la pantalla y stateless es para que no se pueda cambiar el estado de la pantalla
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  //creando los objetos de la categorias
} //terminacion de la clase HomeScreen principal

class _HomeScreenState extends State<HomeScreen> {
  final List<Categoria> categorias = const [
    Categoria('ropa', Icons.checkroom),
    Categoria('Calzado', Icons.hiking),
    Categoria('Juguetes', Icons.toys),
    Categoria('Hogar', Icons.chair),
    Categoria('Belleza', Icons.face_retouching_natural),
    Categoria('Cocina', Icons.kitchen),
    Categoria('Medicamento', Icons.storefront),
  ];
  //creando la lista de productos
  final ProductService _productService = ProductService();
  late Future<List<Producto>> _futureProductos; // el late es para cargar los productos de manera asincrona y que no se carguen al inicio de la aplicacion

  @override
  void initState() {
    //Todo: implement initState
    super.initState();
    _futureProductos = _productService.obtenerProductos(); //cargando los productos de manera asincrona solo una vez al inicio de la aplicacion
  }

  void _reintentarCarga() {
    setState(() {
      _futureProductos = _productService.obtenerProductos(); //cargando los productos de manera asincrona en caso de error se puede reintentar la carga de los productos
    });
  }
  /*
  final List<Producto> productos = const [
    Producto(
      'Camisa',
      399,
      Icons.checkroom,
    ), //google material para seleccionar los iconos
    Producto('Zapatos', 1000, Icons.hiking),
    Producto('Muñeca', 570, Icons.toys),
    Producto('Silla', 1500, Icons.chair),
    Producto('Maquillaje', 20, Icons.face_retouching_natural),
    Producto('Medicamento', 10, Icons.storefront),
  ];
  */

  //metodo para el boton flotante de la pantalla principal
  void _mostrarMensajeAgergar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opción para agregar producto')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarMensajeAgergar,
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          //diego andre villa vera
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            backgroundColor: Colors.deepOrange,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Tienda App v2',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola Diego',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Que vamos a comprar hoy?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromARGB(255, 231, 106, 4),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'Categorias',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, //Diego Andre Villa Vera
                      itemCount: categorias.length,
                      itemBuilder: (context, index) {
                        final categoria = categorias[index];
                        return CategoriaItem(categoria: categoria);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "productos destacados",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),

          FutureBuilder<List<Producto>>(
            future: _futureProductos,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),

                    child: Column(
                      children: [
                        const Icon(Icons.error, size: 48, color: Colors.red),
                        const Text('Error al cargar los productos'),

                        ElevatedButton(
                          onPressed: _reintentarCarga,
                          child: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final productos = snapshot.data!;
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ProductoCard(producto: productos[index]);
                  }, childCount: productos.length),
                ),
              );
            }),

            /*
          SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductoCard(producto: productos[index]);
                },
                childCount: productos.length,

              ),
            ),
          ),
          */
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),  
        ],
      ),
    );
  }
}
