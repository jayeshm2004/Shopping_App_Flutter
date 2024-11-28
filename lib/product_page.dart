import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Reebok"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 219, 219, 219)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(60)));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(135, 223, 219, 219),
                        side: const BorderSide(
                            color: Color.fromARGB(135, 223, 219, 219)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: size.width > 650
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2,
                        
                          crossAxisCount: 2),
                          itemCount: products.length,
                      itemBuilder: (context,index){
                        final product=products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(product: product);
                            }));
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            image: product['imageURL'] as String,
                            price: product['price'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromARGB(255, 181, 181, 235)
                                : const Color.fromARGB(255, 189, 208, 186),
                          ),
                        );

                      })
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductDetailsPage(product: product);
                            }));
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            image: product['imageURL'] as String,
                            price: product['price'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromARGB(255, 181, 181, 235)
                                : const Color.fromARGB(255, 189, 208, 186),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
