import 'package:flutter/material.dart';
import 'package:flutter_final_project/controllers/info_controller.dart';
import 'package:flutter_final_project/controllers/login_controller.dart';
import 'package:flutter_final_project/controllers/qr_scanner_controller.dart';
import 'package:flutter_final_project/routes/route_generator.dart';
import 'package:provider/provider.dart';

//TODO: PRUEBAS WIDGET, PLATICAS DE ENTREVISTA, VER MVC

//TODO: PROYECTO FINAL: 

/*
  [] - Una app con login(2 textfields email-contrasena), 
  [] - boton consume endpoint y hace un post
  [] - Todos los endpoints mockeados
  [] - Sin guardar token
  [] - Validacion email password
  [] - Usar provider como manejador de estado
  [] - Navega segunda pantalla con 4 botones(escanear qr, informacion, num de serie, logout)
    
    Botones llevan
  [] - 1. Escanner abre paquete qr scanner (mockear llamadas con Future delay y regrese json mockeado)
  [] - 2. Navega pantalla nueva sera http.get que trae marca, modelo y serie e imprimir en pantalla Textfield y boton de regresar
  [] - 3. Navega pantalla con textfield usuario ingresa el id y boton que mande el id mediante un post a la llamada
  [] - 4. manda otro endpoint delete y navega al login
*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(create: (_) => LoginController()),
        ChangeNotifierProvider<InfoController>(create: (_) => InfoController()),
        ChangeNotifierProvider<QRScannerController>(create: (_) => QRScannerController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}