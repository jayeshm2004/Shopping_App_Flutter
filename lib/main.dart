import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shopping App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow,
              surface: Colors.white,
              primary: Colors.yellow,
              
               ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            )
          ),
          
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey,
            ),
            prefixIconColor: Colors.grey
          ),
          textTheme:const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            titleLarge: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
           ),
             bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          )
        ),
        
        home:  const HomePage(),
      ),
    );
  }
}
