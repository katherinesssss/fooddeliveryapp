import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/login_or_register.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
//При открытии приложения AuthGate подписывается на поток authStateChanges().

//Если пользователь уже вошёл (например, сохранил сессию), поток вернёт его данные (User объект)
// → snapshot.hasData == true → покажется HomePage().

//Если пользователь не вошёл → snapshot.hasData == false → покажется LoginOrRegister().

//Если пользователь выйдет или войдёт позже, поток обновится, и интерфейс автоматически перестроится.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            //user is logged in
            if (snapshot.hasData){
              return const HomePage();
            }

            //user is not logged in
            else {
              return const LoginOrRegister();
            }
          }
      ),
    );
  }
}
