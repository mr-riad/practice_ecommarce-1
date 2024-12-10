import 'package:brandstore/viewa/home_section/sliderpage.dart';
import 'package:brandstore/viewa/product_details/cart_page.dart';
import 'package:brandstore/viewa/product_details/product_page.dart';
import 'package:flutter/material.dart';
import 'home_section/catagory_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> cartItems = [];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to appropriate pages based on the index
    switch (index) {
      case 0:
      // Navigate to Home Page (implement your logic here)
        break;
      case 1:
      // Navigate to the Cart Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToCartPage(cartItems: cartItems),
          ),
        );
        break;
      case 2:
      // Navigate to Profile Page (implement your logic here)
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Omni',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: const HomePageContent(), // Add HomePageContent widget here
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.15, // 15% of screen height
            width: double.infinity,
            child:  CategoryPage(), // Add CategoryPage widget here
          ),
          SizedBox(
            height: size.height * 0.25, // 25% of screen height
            width: double.infinity,
            child: const SliderPage(), // Add SliderPage widget here
          ),
          SizedBox(
            height: size.height * 0.5, // 50% of screen height
            child: const ProductPage(), // Add ProductPage widget here
          ),
        ],
      ),
    );
  }
}
