import 'package:flutter/material.dart';
import 'package:flutter_final_project/controllers/info_controller.dart';
import 'package:flutter_final_project/controllers/login_controller.dart';
import 'package:flutter_final_project/models/information/info_model.dart';
import 'package:flutter_final_project/view/widgets/menu_button_widget.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
   
  const MenuScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final infoController = Provider.of<InfoController>(context, listen: false);
    final loginController = Provider.of<LoginController>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Menu'),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Menu',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 40,),
            const MenuButtonWidget(
              titleButton: 'Escanner QR',
              routeName: '/scanner',
              ),
            SizedBox(
              width: 270,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed('/loading');
                  await infoController.getData();
                  final InfoModel? info = infoController.infoModel;
                  Navigator.of(context).pushReplacementNamed(
                    '/information', 
                    arguments: info
                  );
                }, 
                child: const Text('Informacion')
                ),
            ),
            const MenuButtonWidget(
              titleButton: 'Numero de serie',
              routeName: '/serial',
              ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 270,
              child: ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
                  Navigator.of(context).pushNamed('/loading');
                  await loginController.logout();
                  Navigator.of(context).pushReplacementNamed(
                    '/login', 
                  );
                }, 
                child: const Text('Logout')
                ),
            ),
          ],
         ),
      )
    );
  }
}