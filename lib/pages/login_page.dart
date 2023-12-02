import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_button.dart';
import 'package:minimal_markt/components/my_text_field.dart';
import 'package:minimal_markt/helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    }
    //display any errors
    on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(
                height: 25,
              ),

              //app name
              const Text(
                'M I N I M A L',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 25,
              ),

              //email textfield
              MyTextField(
                  hintText: 'E-mail',
                  obsecureText: false,
                  controller: emailController),

              const SizedBox(
                height: 25,
              ),

              //password textfield
              MyTextField(
                  hintText: 'Password',
                  obsecureText: true,
                  controller: passwordController),

              const SizedBox(
                height: 10,
              ),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forgot password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              //sign in button
              MyButton(
                onTap: signIn,
                child: const Text('Sign in'),
              ),

              //do not have account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
