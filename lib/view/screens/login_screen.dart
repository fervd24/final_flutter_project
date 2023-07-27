
import 'package:flutter/material.dart';
import 'package:flutter_final_project/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //TODO: move isButtonEnabled to controller
  
  @override
  Widget build(BuildContext context) {

    final loginController = Provider.of<LoginController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
                const SizedBox(height: 30,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: loginController.errorEmailMessage
                  ),
                  onChanged: (value) => loginController.updateEmail(value)
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: loginController.errorPasswordMessage,
                  ),
                  obscureText: true,
                  onChanged: (value) => loginController.updatePassword(value),
                ),
                const SizedBox(height: 32),
                loginController.isLoading 
                ? const CircularProgressIndicator()
                : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginController.isEmailValid && loginController.isPasswordValid 
                      ? () async => await loginController.login(emailController.text, passwordController.text, context)
                      : null,
                    child: const Text('Login'),    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}