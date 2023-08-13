import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ConvexAppBar(
          top: -13,
          height: 55,
          curveSize: 70,
          elevation: 0.5,
          style: TabStyle.fixed,
          backgroundColor: Colors.white,
          items: const [
            TabItem(
              title: ' ',
              icon: Icon(Icons.home_outlined, color: Colors.grey, size: 30),
            ),
            TabItem(
              title: ' ',
              icon: Icon(Icons.search_outlined, color: Colors.grey, size: 30),
            ),
            TabItem(
              title: ' ',
              icon: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Icon(Icons.shopping_bag_outlined, color: Colors.grey, size: 30),
              ),
            ),
            TabItem(
              title: ' ',
              icon: Icon(Icons.widgets_outlined, color: Colors.grey, size: 30),
            ),
            TabItem(
              title: ' ',
              icon: Icon(Icons.favorite_border_outlined, color: Colors.grey, size: 30),
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 2:
                break;
              default:
                setState(() => _currentIndex = index);
                break;
            }
          },
        ),
        AnimatedContainer(
          height: 2,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          width: MediaQuery.sizeOf(context).width / 5,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          margin: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width / 5 * _currentIndex + 17,
            right: MediaQuery.sizeOf(context).width / 5 * (4 - _currentIndex) + 10,
          ),
        ),
      ],
    );
  }
}
