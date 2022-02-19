import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class SalamtakAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final int color;

  const SalamtakAppBar({
    Key? key,
    @required this.height, this.color = 0xff232323,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: TopClipper(color: this.color),
          child: Container(
            child: Center(
              child: Image.asset('assets/images/logob.png',
              color: Color(SPrimaryColor),
              width: MediaQuery.of(context).size.width * 0.45,),
            ),
          ),
        ),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height!);
}

class TopClipper extends CustomPainter {
  final int? color;

  TopClipper({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(this.color!)
      ..strokeWidth = 8;
    var path = new Path();
    path.lineTo(0, size.height * 0.4);

    var firstEndPoint = new Offset(size.width, size.height * 0.4);
    var firstControlPoint = new Offset(size.width * 0.5, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Colors.grey.withAlpha(50), 4.0, false);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
