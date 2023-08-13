import 'package:flutter/material.dart';

class SizeQty extends StatelessWidget {
  const SizeQty({
    super.key,
    required this.sizeQtyOffset,
    required this.sizeQtyRotateX,
    required this.forwardAnimation,
  });

  final double sizeQtyOffset;
  final double sizeQtyRotateX;
  final void Function() forwardAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 120),
      child: Transform.translate(
        offset: Offset(0, sizeQtyOffset),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(sizeQtyRotateX),
          alignment: FractionalOffset.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'SIZE',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    size: 30,
                    color: Colors.grey[400],
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 34,
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
              Row(
                children: [
                  Text(
                    'QTY 1',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    size: 30,
                    color: Colors.grey[400],
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: forwardAnimation,
                child: Container(
                  width: 60,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                        color: Colors.orange.withOpacity(0.6),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange[300]!, Colors.orange],
                    ),
                  ),
                  child: const Icon(Icons.add, size: 46, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
