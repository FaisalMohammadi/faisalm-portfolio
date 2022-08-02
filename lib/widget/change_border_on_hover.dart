import 'package:flutter/material.dart';

class ChangeBorderOnHover extends StatefulWidget {
  final Widget? child;
  ChangeBorderOnHover({Key? key, this.child}) : super(key: key);

  @override
  _ChangeBorderOnHoverState createState() => _ChangeBorderOnHoverState();
}

class _ChangeBorderOnHoverState extends State<ChangeBorderOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  Decoration? decoration;
  Color? containerBorderColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      //onEnter: (e) => _changeBorderColor(),
      onExit: (e) => _mouseExit(),
      onHover: (e) => _changeBorderColor(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: AnimatedContainer(
          //color: containerBorderColor,
          decoration: decoration,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
          //transform: _hovering ? hoverTransform : nonHoverTransform,
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
