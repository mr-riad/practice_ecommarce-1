import 'package:flutter/material.dart';

class AddToCartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const AddToCartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.network(
              product['image'],
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product['name']),
            subtitle: Text('\$${product['discountPrice']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cartItems.removeAt(index);
                (context as Element).reassemble();
              },
            ),
          );
        },
      ),
    );
  }
}
