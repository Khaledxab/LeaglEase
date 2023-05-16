import 'package:flutter/material.dart';
import 'package:legalease/screens/client/createCase.dart';
import 'package:legalease/screens/welcome.dart';

import '../../chat/chat_page.dart';
import '../../chat/api.dart';
import '../client/cases_history.dart';
import '../client/docs.dart';




class BottomNavBarCurvedFb1 extends StatefulWidget {
  const BottomNavBarCurvedFb1({Key? key}) : super(key: key);

  @override
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    const primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;

    final accentColor = const Color(0xffffffff);
    const backgroundColor = Colors.white;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(Icons.home_outlined),
                elevation: 0.1,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "GPS",
                  icon: Icons.lock_clock_outlined,
                  selected: true,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyCasesHistoryPage()));
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "services",
                  icon: Icons.add,
                  selected: false,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => createCase()));
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                SizedBox(width: 56),
                NavBarIcon(
                    text: "Hot alerts",
                    icon: Icons.chat_outlined, 
                    selected: false,
                    onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage(chatApi: ChatApi()))
              );
            },
            defaultColor: secondaryColor,
            selectedColor: primaryColor,),
                NavBarIcon(
                  text: "camera",
                  icon: Icons.document_scanner_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PdfPage()));
                  },
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // logout
  
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
