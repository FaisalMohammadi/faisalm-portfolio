import 'package:flutter/material.dart';

import '../../common/configs/app_responsive.dart';
import 'contact_desktop.dart';
import 'contact_mobile.dart';


class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppResponsive(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
