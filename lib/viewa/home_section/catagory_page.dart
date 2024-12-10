import 'package:flutter/material.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Categories
  final List<Map<String, dynamic>> categories = [
    {'name': 'Fashion', 'icon': Icons.man},
    {'name': 'Electronics', 'icon': Icons.electric_bolt_rounded},
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Books', 'icon': Icons.book},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
    {'name': 'Fashion', 'icon': Icons.abc},
    {'name': 'Fashion', 'icon': Icons.man},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            category['icon'],
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          category['name'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
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
