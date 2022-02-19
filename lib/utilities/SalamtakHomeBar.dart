import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SalamtakHomeBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final int color;

  const SalamtakHomeBar({
    Key? key,
    required this.height,
    this.color = 0xff1BFCD6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: TopClipper(
            color: 0xff2d313d,
            height: this.height * 0.74,
            endPointHeight: this.height * 1.15,
          ),
          child: CustomPaint(
            painter: TopClipper(
              height: this.height * 0.68,
              endPointHeight: this.height,
              color: 0xff171b27,
            ),
            child: CustomPaint(
              painter: TopClipper(
                  color: 0xff23293f,
                  height: this.height * 0.6,
                  endPointHeight: this.height * 1.3),
              child: Container(
                child: Center(
                  child: Container(
                    height: this.height * 0.5,
                    width: this.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 5,
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 30,
                      color: Color(0xff98e6f2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class TopClipper extends CustomPainter {
  final int? color;
  final double? height;
  final double? endPointHeight;

  TopClipper({this.color, this.height, this.endPointHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 0
      ..color = Color(this.color!);

    var path = new Path();
    path.lineTo(0, this.height!);

    var firstEndPoint = new Offset(size.width, this.height!);
    var firstControlPoint = new Offset(size.width * 0.5, this.endPointHeight!);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
