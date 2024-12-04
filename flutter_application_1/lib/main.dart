import 'package:flutter/material.dart';
import 'package:flutter_application_1/navegadores/drawer.dart';
import 'package:flutter_application_1/screens/pantalla2.dart';

void main() {
  runApp(const Pantalla1());
}

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 83, 12, 12),
      ),
      drawer: MiDrawer(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
             'https://wallpapers.com/images/hd/christmas-phone-background-w7ri30km81x6nx4e.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Pantalla 1",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Wendy Portilla",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, 
                  ),
                ),
                 const Text(
                  "MOVILES III",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, 
                  ),
                ),
                 const Text(
                  "GitHub: WendyPortilla",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, 
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void navegar02(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Pantalla2()),
  );
}
