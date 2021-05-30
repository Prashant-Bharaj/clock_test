import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/widgets.dart';

final Color primaryColor = Colors.blueAccent;
final TargetPlatform platform = TargetPlatform.android;

void main() {
  runApp(Clock());
}




class ClockPainter extends CustomPainter {
  static const circleRadius = 100.0;
  static const area = math.pi * 10 * 10;
  static const tau = math.pi * 2;
  static final phi = (math.sqrt(5) + 1) / 2;
  @override
  void paint(Canvas canvas, Size size) {
    var center = size.width / 2;
    var centerY = size.height / 2;
    var x = center;
    var y = centerY;

    drawClock(canvas, x, y);
    drawL(canvas, x, y, 90);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return true;
  }

  void drawL(Canvas canvas, num x, num y, num z) {
    var paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.black54;
    // canvas.drawLine(Offset((x+circleRadius)/2 + circleRadius,(y-circleRadius)), Offset(circleRadius*2,y-circleRadius), paint);
    //   canvas.drawLine(Offset(x,y-circleRadius), Offset(circleRadius,y-circleRadius), paint);
    canvas.drawLine(Offset(x, y), Offset(x + circleRadius, y), paint);
  }

  void drawClock(Canvas canvas, num x, num y) {
    var paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    // canvas.drawCircle(Offset(x-circleRadius, y-circleRadius), circleRadius, paint);
    canvas.drawCircle(Offset(x, y), circleRadius, paint);
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        platform: platform,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Clock")),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    "Clock",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 400,
                      height: 400,
                      child: CustomPaint(
                        painter: ClockPainter(),
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
