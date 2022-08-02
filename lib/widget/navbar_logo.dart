import 'package:flutter/material.dart';

import '../common/configs/app_typography.dart';
import '../utils/utils.dart';
import 'package:faisalm_portfolio/common/extension/hover_ext.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: AppText.b1,
        ),
        /* Image.asset(
          StaticUtils.signature,
          height: AppDimensions.normalize(20),
        ), */
        Text(
          "Faisal Mohammadi",
          style: AppText.b1b!.copyWith(
            fontFamily: 'Agustina',
            //color: Colors.amber
          ),
        ).changeNavbarLogoTextColorOnHover,
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          style: AppText.b1,
        )
      ],
    );
  }
}
