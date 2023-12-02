import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_text_field.dart';

class ForgetPassword extends StatelessWidget {
 ForgetPassword({super.key});
  
  //text controller
  final TextEditingController forgetpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //Headings
            Text(
              '',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 25,),
            Text(
              '',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          //Text field
          MyTextField(
            hintText: 'e-mail', controller: forgetpassController, obsecureText: false, 
          ),

          const SizedBox(height: 25,),
          // submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){}, child: Text(''),),
          ),
          
          ],
        ),
      ),
    );
  }
}
