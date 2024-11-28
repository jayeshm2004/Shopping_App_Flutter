import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageURL'] as String),
                radius: 30,
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete Product",
                                style: Theme.of(context).textTheme.titleMedium),
                            content: Text(
                                'Are you sure you want to delete this product?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes",
                                    style: TextStyle(color: Colors.red)),
                              ),
                              
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text(cartItem['size'].toString()),
            );
          }),
    );
  }
}
