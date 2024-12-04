import 'package:flutter/material.dart';
import 'package:flutter_application_1/navegadores/drawer.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  final TextEditingController alturaController = TextEditingController();

  final double densidad = 1025.0;
  final double gravedad = 9.8;

  void calcularPresion() {
    double? altura = double.tryParse(alturaController.text);

    if (altura == null) {
      mostrarResultado('Error', 'Por favor, ingrese un valor válido para la altura.');
      return;
    }

    double presion = densidad * gravedad * altura;

    mostrarResultado('Resultado', 'Presión calculada: ${presion.toStringAsFixed(2)} Pa');
  }

  void mostrarResultado(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            mensaje,
            style: const TextStyle(fontSize: 16),
          ),
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
        title: const Text('Cálculo de Presión',style: TextStyle(color: Colors.white),),
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
                    'Cálculo de Presión',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
              
                  TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (m)',
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
                    onPressed: calcularPresion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 150, 243),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Calcular Presión',
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
