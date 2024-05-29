import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/pages/cart.dart';
import 'package:shoppy/pages/cart_provider.dart';
import 'package:shoppy/pages/profile.dart';
import 'package:shoppy/pages/productitem.dart';
import 'package:shoppy/models/product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<Product> coffeeProducts = [
    Product(name: 'Espresso', image: 'Espresso.png', price: 2.99),
    Product(name: 'Cappuccino', image: 'Capuccino.png', price: 3.99),
    Product(name: 'Latte', image: 'latte.png', price: 4.49),
    Product(name: 'Americano', image: 'americano.png', price: 2.49),
    Product(name: 'Pastries', image: 'pastries.png', price: 4.99),
    Product(name: 'Smoothie', image: 'smoothie.png', price: 3.79),
    Product(name: 'Tea', image: 'tea.png', price: 3.29),
    Product(name: 'Hot Chocolate', image: 'hotchocolate.png', price: 5.99),
  ];

  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(coffeeProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopeasy'),
        actions: <Widget>[
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Products...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: _filterProducts,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: displayedProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: displayedProducts[index],
            onAddToCart: (product) {
              _addToCart(context, product);
            },
          );
        },
      ),
    );
  }

  void _filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedProducts = List.from(coffeeProducts);
      });
      return;
    }
    final filtered = coffeeProducts.where((product) {
      final productName = product.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return productName.contains(searchLower);
    }).toList();

    setState(() {
      displayedProducts = filtered;
    });
  }

  void _addToCart(BuildContext context, Product product) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Added to Cart'),
          content: Text('${product.name} has been added to your cart.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
