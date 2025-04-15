import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_button.dart';
import 'package:fooddeliveryapp/components/my_textfield.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;

  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordlController = TextEditingController();

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
            "Food Delivery App",
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
            //sign in button
            MyButton(
              text: "Sign In",
              onTap: (){}
              ,),
            const SizedBox(height: 25,),
            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                const SizedBox(height: 25,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now!",
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