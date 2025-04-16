import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordlController = TextEditingController();
  final TextEditingController confirmPasswordlController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25,),
            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25,),
            //email textfield
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 25,),
            //password textfield
            MyTextfield(
              controller: passwordlController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),
            //confirm password textfield
            MyTextfield(
              controller: confirmPasswordlController,
              hintText: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),
            //sign up button
            MyButton(
              text: "Sign Up",
              onTap: (){}
              ,),
            const SizedBox(height: 25,),
            //already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                const SizedBox(height: 25,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )


              ],)
          ],
        ),
      ),

    );
  }
}
