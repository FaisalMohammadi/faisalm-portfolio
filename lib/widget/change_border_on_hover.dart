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
      //onEnter: (e) => _mouseEnter(),
      onExit: (e) => _mouseExit(),
      onHover: (e) => _changeBorderColor(),
      child: AnimatedContainer(
        decoration: decoration,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        //transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseExit() {
    setState(() {
      decoration = null;
    });
  }

  void _changeBorderColor() {
    setState(() {
      //containerColor = Colors.red;
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.red,
            width: 1.5,
          ));
    });
  }
}
