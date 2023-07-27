import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/information/info_model.dart';

class InfoScreen extends StatelessWidget {
  final InfoModel info;

  const InfoScreen({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion')
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Informacion del equipo:', style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 40,),
              Text('Marca: ${info.brand}', style: const TextStyle(fontSize: 18),),
              const SizedBox(height: 20,),
              Text('Modelo: ${info.model}', style: const TextStyle(fontSize: 18),),
              const SizedBox(height: 20,),
              Text('Numero de serie: ${info.serialNumber}', style: const TextStyle(fontSize: 18),),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/menu'), 
                  child: const Text('Regresar a menu')
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}