import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/login_or_register.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      //restaurant provider
      ChangeNotifierProvider(create: (context)=>Restaurant()),
    ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
