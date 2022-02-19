import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Constants.dart';

class SalamtakSplash extends StatelessWidget {
  final int color;

  const SalamtakSplash({
    Key? key,
    this.color = SPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TopClipper(color: this.color),
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/FMOHSD.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              Spacer(),
              Image.asset(
                'assets/images/logob.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              Spacer(flex: 3,),
            ],
          ),
        ),
      ),
    );
  }
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
    path.lineTo(0, size.height * 0.6);

    var firstEndPoint = new Offset(size.width, size.height * 0.6);
    var firstControlPoint = new Offset(size.width * 0.5, size.height * 0.8);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Colors.grey.withAlpha(50), 4.0, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
