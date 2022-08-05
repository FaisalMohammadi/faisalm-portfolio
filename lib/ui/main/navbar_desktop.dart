
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../common/animations/entrance_fader.dart';
import '../../common/configs/app_dimensions.dart';
import '../../common/configs/app_typography.dart';
import '../../common/configs/space.dart';
import '../../common/themes/app_theme.dart';
import '../../provider/app_provider.dart';
import '../../provider/drawer_provider.dart';
import '../../utils/navbar_utils.dart';
import '../../utils/utils.dart';
import '../../widget/navbar_actions_button.dart';
import '../../widget/navbar_logo.dart';
import 'package:universal_html/html.dart' as html;

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      padding: Space.all(),
      color: appProvider.isDark ? Colors.black : Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          Space.xm!,
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavBarActionButton(
                  label: e.value,
                  index: e.key,
                ),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              hoverColor: AppTheme.c!.primary!.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: AppTheme.c!.primary!,
                ),
              ),
              onPressed: () {
                html.window.open(
                  StaticUtils.resume,
                  "pdf",
                );
              },
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: Text(
                  'RESUME',
                  style: AppText.l1b,
                ),
              ),
            ),
          ),
          Space.x!,
          Flexible(
            child: Switch(
              inactiveTrackColor: Colors.grey,
              value: appProvider.isDark,
              onChanged: (value) {
                appProvider.setTheme(
                  !value ? ThemeMode.light : ThemeMode.dark,
                );
              },
              activeColor: AppTheme.c!.primary!,
            ),
          ),
          Space.x!,
        ],
      ),
    );
  }
}
