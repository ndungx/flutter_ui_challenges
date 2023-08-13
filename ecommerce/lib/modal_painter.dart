import 'package:flutter/material.dart';

class ModalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;

    var path = Path();

    // move to the top left corner
    path.moveTo(0, size.height * 0.1);

    //? left side
    path.lineTo(0, size.height * 0.82);
    //* br bottom left
    path.quadraticBezierTo(
      0,
      size.height * 0.85,
      size.width * 0.05,
      size.height * 0.85,
    );

    //? bottom left
    path.lineTo(size.width * 0.05, size.height * 0.85);
    path.lineTo(size.width * 0.35, size.height * 0.85);
    //?

    //! left rounded corner
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.85,
      size.width * 0.45,
      size.height * 0.9,
    );

    //! border radius for the bottom peek
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.95,
      size.width * 0.55,
      size.height * 0.9,
    );

    //! right rounded corner
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.85,
      size.width * 0.65,
      size.height * 0.85,
    );

    //? bottom right
    path.lineTo(size.width * 0.65, size.height * 0.85);
    path.lineTo(size.width * 0.95, size.height * 0.85);
    //?

    //* br bottom right
    path.quadraticBezierTo(
      size.width,
      size.height * 0.85,
      size.width,
      size.height * 0.82,
    );
    //?
    path.lineTo(size.width, size.height * 0.08);
    //* br top right
    path.quadraticBezierTo(
      size.width,
      size.height * 0.05,
      size.width * 0.95,
      size.height * 0.05,
    );
    //? top
    path.lineTo(size.width * 0.05, size.height * 0.05);
    //* br top left
    path.quadraticBezierTo(
      0,
      size.height * 0.05,
      0,
      size.height * 0.08,
    );

    path.close();

    var shahowPaint = Paint()
      ..color = Colors.grey[400]!
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawPath(path, shahowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
