import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class DrawerProvider extends ChangeNotifier {
  final scafoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get key => scafoldKey;
}
