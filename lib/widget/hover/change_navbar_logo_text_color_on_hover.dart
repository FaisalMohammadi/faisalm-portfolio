import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../common/configs/app_typography.dart';

/// creates a gradient color for navbar logo text
class ChangeNavbarLogoTextColorOnHover extends StatefulWidget {
  final Widget? child;
  ChangeNavbarLogoTextColorOnHover({Key? key, this.child}) : super(key: key);

  @override
  _ChangeNavbarLogoTextColorOnHoverState createState() =>
      _ChangeNavbarLogoTextColorOnHoverState();
}

class _ChangeNavbarLogoTextColorOnHoverState
    extends State<ChangeNavbarLogoTextColorOnHover> {
  Paint? gradientColors;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (e) => _mouseExit(),
      onHover: (e) => _changeColor(),
      child: Text(
        "Faisal Mohammadi",
        style: AppText.b1b!
            .copyWith(fontFamily: 'Agustina', foreground: gradientColors),
      ),
    );
  }

  void _mouseExit() {
    setState(() {
      gradientColors = null;
    });
  }

  void _changeColor() {
    setState(() {
      gradientColors = Paint()
        ..shader = LinearGradient(
          colors: <Color>[
            HexColor("D4145A"),
            HexColor("FBB03B"),
            //add more color here.
          ],
        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0));
    });
  }
}
