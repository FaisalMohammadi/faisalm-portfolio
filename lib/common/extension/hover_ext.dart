import 'package:faisalm_portfolio/widget/hover/change_border_on_hover.dart';
import 'package:faisalm_portfolio/widget/hover/change_navbar_logo_text_color_on_hover.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import '../../widget/hover/move_up_on_hover.dart';

extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // the widget we're using the extension on
      onHover: (event) => appContainer?.style.cursor = 'pointer',
      onExit: (event) => appContainer?.style.cursor = 'default',
    );
  }

  Widget get changeBackgroundColorOnHover {
    return ChangeBorderOnHover(
      child: this,
    );
  }

  Widget get moveUpOnHover {
    return MoveUpOnHover(
      child: this,
    );
  }

  /// creates a gradient color for navbar logo text
  Widget get changeNavbarLogoTextColorOnHover {
    return ChangeNavbarLogoTextColorOnHover(
      child: this,
    );
  }
}
