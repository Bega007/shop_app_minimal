import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_button.dart';
import 'package:minimal_markt/components/my_text_field.dart';
import 'package:minimal_markt/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  // register method
  Future<void> registerUser() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //make sure passwords match
    if (passwordController.text != confirmPassword.text) {
      //pop loading circle
      Navigator.pop(context);
      //show error message to user
      displayMessageToUser('Passwords do not match', context);
    }
    //if passwords do match
    else{
      
    }
    //try creating the user
    try {
      //create the user
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message to user
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

              //user name textfield
              MyTextField(
                  hintText: 'User name',
                  obsecureText: false,
                  controller: userNameController),

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
                height: 25,
              ),

              //confirm password textfield
              MyTextField(
                  hintText: 'confirm password',
                  obsecureText: true,
                  controller: confirmPassword),

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

              //register button
              MyButton(
                onTap: registerUser,
                child: const Text('Register'),
              ),

              //do you have account? Sign in here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Allready have an account?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign in',
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
