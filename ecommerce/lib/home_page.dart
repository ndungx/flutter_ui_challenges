import 'package:ecommerce/bnb.dart';
import 'package:ecommerce/product_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded, color: Colors.grey[700]),
        ),
        centerTitle: true,
        title: Text('Nike', style: TextStyle(color: Colors.grey[400])),
      ),
      body: const ProductDetails(),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
