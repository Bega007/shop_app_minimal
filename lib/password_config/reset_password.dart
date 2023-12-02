import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            //Image
            Image(
              image: const AssetImage(''),
              width: 250,
            ),

            const SizedBox(
              height: 25,
            ),

            //Title & Subtitle
            Text('title'),

            const SizedBox(
              height: 10,
            ),

            Text('subtitle'),

            const SizedBox(
              height: 10,
            ),

            //Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Done'),
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 25,),

             SizedBox(
              width: double.infinity,
              child: TextButton(
                child: Text('Resend e-mail'),
                onPressed: () {},
              ),
            ),


          ]),
        ),
      ),
    );
  }
}
