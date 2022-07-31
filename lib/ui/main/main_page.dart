import 'package:faisalm_portfolio/common/configs/app_initializations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../common/configs/app_responsive.dart';
import '../../provider/drawer_provider.dart';
import '../../widget/arrow_on_top.dart';
import 'body.dart';
import 'mobile_drawer.dart';
import 'navbar_desktop.dart';
import 'navbar_tablet.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    AppInitializations.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !AppResponsive.isDesktop(context) ? const MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const Body(),
            const ArrowOnTop(),
            AppResponsive.isTablet(context) || AppResponsive.isMobile(context)
                ? const NavBarTablet()
                : const NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
