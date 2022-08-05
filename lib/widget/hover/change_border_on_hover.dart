import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangeBorderOnHover extends StatefulWidget {
  final Widget? child;
  ChangeBorderOnHover({Key? key, this.child}) : super(key: key);

  @override
  _ChangeBorderOnHoverState createState() => _ChangeBorderOnHoverState();
}

class _ChangeBorderOnHoverState extends State<ChangeBorderOnHover> {
  Decoration? decoration;
  Color? containerBorderColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      //onEnter: (e) => _changeBorderColor(),
      onExit: (e) => _mouseExit(),
      onHover: (e) => _changeBorderColor(),
      child: ClipPath(
        clipper: CustomClipPath(),
        //borderRadius: BorderRadius.circular(50),
        child: AnimatedContainer(
          //color: containerBorderColor,
          decoration: decoration,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }

  void _mouseExit() {
    setState(() {
      containerBorderColor = null;
      decoration = null;
    });
  }

  void _changeBorderColor() {
    setState(() {
      containerBorderColor = Colors.red;
      decoration = BoxDecoration(
        color: Colors.blue,
        //borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            HexColor("D4145A"),
            HexColor("FBB03B"),
          ],
        ),
      );
      /* decoration = BoxDecoration(
        //color: Colors.blue,
        border: Border.all(
          color: Colors.red,
          width: 1.5,
        ),
      ); */
    });
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;

  @override
  Path getClip(Size size) {
    
    final double startMargin = size.width / 14;
    Path path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width / 1.2, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
