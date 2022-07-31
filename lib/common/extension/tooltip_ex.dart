import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// wraps any button with the customized tooltip
extension TooltipEx on ButtonStyleButton {
  /// shows a custom tooltip
  Tooltip showTooltip(String text) {
    return Tooltip(
      message: text,
      enableFeedback: true,
      excludeFromSemantics: true,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      child: this,
    );
  }
}
