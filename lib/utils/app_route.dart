import 'package:bhagvat_geeta_app/screen/home/view/home_screen.dart';
import 'package:bhagvat_geeta_app/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screen/detail/detail_screen.dart';

Map<String, WidgetBuilder> app_route = {
  "/": (context) => SplashScreen(),
  "home": (context) => HomeScreen(),
  "detail": (context) => DetailScreen(),
};
