import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> page=const [
    ProductPage(),
    CartPage()
  ];
  
  
  int currentPage = 0 ;


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children:  page,
        
      ),
      bottomNavigationBar:
          BottomNavigationBar(
            iconSize: 50,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            onTap: (value) {
              setState(() {
                currentPage=value;
              });
            } ,
            currentIndex: currentPage, 
            items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              
            ),
            label: '')
      ]),
    );
  }
}
