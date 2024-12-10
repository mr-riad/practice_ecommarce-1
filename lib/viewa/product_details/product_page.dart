import 'package:flutter/material.dart';
import 'package:brandstore/viewa/product_details/product_details_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Laptop',
      'description': 'Powerful laptop with 16GB RAM, 256GB SSD, and 1TB HDD.',
      'price': '1200',
      'discountPrice': '1000',
      'image': 'https://via.placeholder.com/150',
      'reviews': 4.5,
    },
    {
      'name': 'Smartphone',
      'description': 'High-performance smartphone with 8GB RAM and 128GB storage.',
      'price': '800',
      'discountPrice': '750',
      'image': 'https://via.placeholder.com/150',
      'reviews': 4.0,
    },
    {
      'name': 'Headphones',
      'description': 'Noise-canceling headphones with superior sound quality.',
      'price': '150',
      'discountPrice': '120',
      'image': 'https://via.placeholder.com/150',
      'reviews': 4.8,
    },
    {
      'name': 'Smart Watch',
      'description': 'Stylish smart watch with health and fitness tracking.',
      'price': '300',
      'discountPrice': '250',
      'image': 'https://via.placeholder.com/150',
      'reviews': 4.6,
    },
    {
      'name': 'Tablet',
      'description': 'Compact tablet with 10-inch display and 64GB storage.',
      'price': '500',
      'discountPrice': '450',
      'image': 'https://via.placeholder.com/150',
      'reviews': 4.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600 ? 2 : 4;
    final aspectRatio = screenWidth < 600 ? 0.7 : 0.9;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: Image.network(
                                product['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['description'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          product['reviews'].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '৳${product['price']}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            decoration:
                                            TextDecoration.lineThrough,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          '৳${product['discountPrice']}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
