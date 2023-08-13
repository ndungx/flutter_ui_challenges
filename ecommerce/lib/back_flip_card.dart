import 'package:ecommerce/modal_painter.dart';
import 'package:flutter/material.dart';

class BackFlipCard extends StatelessWidget {
  const BackFlipCard({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomPaint(
        painter: ModalPainter(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.67,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    '\$130',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    'Current Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Get a \$50 gift card for Valentine's Day",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {},
                  child: PhysicalModel(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    shadowColor: Colors.orange,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.orange[300]!, Colors.orange],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Proceed to checkout',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300], thickness: 1, indent: 20)),
                  const SizedBox(width: 10),
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Divider(color: Colors.grey[300], thickness: 1, endIndent: 20)),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Continue shopping',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
