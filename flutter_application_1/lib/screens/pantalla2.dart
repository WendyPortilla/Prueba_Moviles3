import 'package:flutter/material.dart';
import 'package:flutter_application_1/navegadores/drawer.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  State<Pantalla2> createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  final TextEditingController velocidadInicialController = TextEditingController();
  final TextEditingController velocidadFinalController = TextEditingController();

  final double aceleracion = 10.0;
  final double tiempoMinimo = 5.0;

  void calcular() {
    double? velocidadInicial = double.tryParse(velocidadInicialController.text);
    double? velocidadFinal = double.tryParse(velocidadFinalController.text);

    if (velocidadInicial == null || velocidadFinal == null) {
      mostrarResultado('Error', 'Por favor, ingrese valores válidos.');
      return;
    }

    double tiempo = (velocidadFinal - velocidadInicial) / aceleracion;

    if (tiempo >= tiempoMinimo) {
      mostrarResultado('¡Aprobado!', 'Tiempo: ${tiempo.toStringAsFixed(2)} segundos.');
    } else {
      mostrarResultado('No aprobado', 'Tiempo: ${tiempo.toStringAsFixed(2)} segundos.');
    }
  }

  void mostrarResultado(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de Velocidad', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 33, 49, 89),
      ),
      body: Stack(
        children: [
          
          SizedBox.expand(
            child: Image.network(
              'https://www.sdpnoticias.com/resizer/v2/BP7BBYJ57BETPEN3DZHHAW4APY.jpg?smart=true&auth=3434609860c46d0d165512d9eb79a7d0de8cffa247fa3f75cf8ae45c6c86781e&width=564&height=1018',
              fit: BoxFit.cover,
            ),
          ),
          
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), 
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Prueba de Velocidad',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  TextField(
                    controller: velocidadInicialController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Velocidad Inicial (m/s)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                 
                  TextField(
                    controller: velocidadFinalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Velocidad Final (m/s)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
              
                  ElevatedButton(
                    onPressed: calcular,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 150, 243),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}
