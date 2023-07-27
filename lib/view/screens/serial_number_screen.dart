// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_final_project/controllers/serial_number_controller.dart';
import 'package:flutter_final_project/view/widgets/single_data_widget.dart';
import 'package:provider/provider.dart';

import 'package:flutter_final_project/models/serial_number/id_result.dart';

class SerialNumberScreen extends StatelessWidget {
   
  const SerialNumberScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final serialNumberProvider = Provider.of<SerialNumberController>(context);
    final userData = Provider.of<SerialNumberController>(context).idResult;
    final TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Serial Number Screen'),
      ),
      body: Center(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                serialNumberProvider.isLoading 
                  ? const CircularProgressIndicator()
                  : _UserDataWidget(userData: userData),
         
                const SizedBox(height: 30,),
         
                const Text(
                  'Ingresa el id:',
                  style: TextStyle(fontSize: 30),
                  ),
                const SizedBox(height: 30,),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.numbers),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue, width: 2.0)
                    )
                  ),
                  onChanged: (value) {
         
                  },
                ),
         
                const SizedBox(height: 20,),
         
                SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                        onPressed: () => serialNumberProvider.getDataById(idController.text, context),
                        child: const Text('Enviar')
                        ),
                    )
              ],
             ),
           ),
         ),
      ),
    );
  }
}

class _UserDataWidget extends StatelessWidget {

  final IDResult? userData;

  const _UserDataWidget({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userData == null 
    ? Container()
    : SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SingleDataWidget(
            paddingSize: 30, 
            textData: 'Datos de usuario:',
            fontSize: 35,
            ),
          SingleDataWidget(
            paddingSize: 20, 
            textData: 'Nombre: ${userData!.firstName}'
            ),
          SingleDataWidget(
            paddingSize: 10, 
            textData: 'Apellido: ${userData!.lastName}'
            ),
          SingleDataWidget(
            paddingSize: 10, 
            textData: 'Email: ${userData!.email}'
            ),
          SingleDataWidget(
            paddingSize: 10, 
            textData: 'Edad: ${userData!.age}'
            ),

        ]
        ),
    );
  }
}
