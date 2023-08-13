import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShoppingBagClipper extends CustomClipper<Path> {
  ShoppingBagClipper(this.context);

  final BuildContext context;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, MediaQuery.sizeOf(context).height * 0.4),
        width: size.width,
        height: 0,
      ),
      0,
      math.pi,
      true,
    );
    // Using -1000 guarantees the card won't be clipped at the top, regardless of its height
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ShoppingBagClipper oldClipper) => false;
}
