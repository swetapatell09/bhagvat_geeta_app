import 'package:bhagvat_geeta_app/screen/home/provider/home_provider.dart';
import 'package:bhagvat_geeta_app/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: HomeProvider())],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getThemeData();

      value.chapterData();
      value.theme = value.isTheme;
      value.isOn == value.theme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_route,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
  ));
}
