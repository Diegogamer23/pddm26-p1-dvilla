import 'package:flutter/material.dart';
import 'package:primer_parcial/screens/home_screen.dart' show HomeScreen;
import 'package:primer_parcial/screens/perfil_screen.dart';
import 'package:primer_parcial/screens/carrito_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indiceActual = 0;

  final List<Widget> _pantallas = [
    HomeScreen(),
    FavoritosScreen(),
    PerfilScreen(),
  ];

  void _cambiarPantalla(int indice) {
    setState(() {
      _indiceActual = indice;  //diego andre Villa Vera
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _indiceActual,
        children: _pantallas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: _cambiarPantalla,
        type: BottomNavigationBarType.fixed, // Evita que se rompa el diseño con 4 ítems
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_sharp),
            label: 'Flores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mi Perfil',
          ),
          
        ],
      ),
    );
  }
}