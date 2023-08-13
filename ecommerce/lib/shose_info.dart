import 'package:flutter/material.dart';

class ShoseInfo extends StatelessWidget {
  const ShoseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 10,
              blurRadius: 15,
              blurStyle: BlurStyle.normal,
              offset: Offset(3, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              '\$170',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
            ),
            Text(
              "Nike Air Force 1 '07",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Text(
              'All White',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
