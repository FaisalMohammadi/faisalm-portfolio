import 'package:faisalm_portfolio/common/extension/hover_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/animations/entrance_fader.dart';
import '../common/configs/app_typography.dart';
import '../common/configs/space.dart';
import '../common/themes/app_theme.dart';
import '../provider/scroll_provider.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: Space.h!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          splashColor: Colors.white54,
          highlightColor: Colors.white54,
          //hoverColor: AppTheme.c!.primary,
          onPressed: () {
            scrollProvider.scroll(index);
          },
          child: Padding(
            padding: Space.all(0.5, 0.45),
            child: Text(
              label,
              style: AppText.l1,
            ),
          ),
        ).changeBorderOnHover.moveUpOnHover,
      ),
    );
  }
}
