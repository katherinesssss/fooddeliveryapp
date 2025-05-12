import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'home_page.dart';


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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //register method
  void register() async{
    final _authService = AuthService();

    if (passwordController.text==confirmPasswordController.text){
      try{
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    }

        catch (e){
          showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    else {
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
    }

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
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),
            //confirm password textfield
            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(height: 25,),
            //sign up button
            MyButton(
              text: "Sign Up",
              onTap: register,
              ),
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


              ],
            )
          ],
        ),
      ),

    );
  }
}

