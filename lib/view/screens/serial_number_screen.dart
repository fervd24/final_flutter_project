import 'package:flutter/material.dart';

class SerialNumberScreen extends StatelessWidget {
   
  const SerialNumberScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serial Number Screen'),
      ),
      body: Center(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter the id:',
                style: TextStyle(fontSize: 30),
                ),
              const SizedBox(height: 30,),
              TextField(
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
                  onPressed: () {

                  },
                  child: const Text('Send')
                  ),
              )
            ],
           ),
         ),
      ),
    );
  }
}