import 'package:bhagvat_geeta_app/screen/home/model/home_model.dart';
import 'package:bhagvat_geeta_app/utils/json_helper.dart';
import 'package:flutter/material.dart';

import '../../../utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  List<ShlokModel> verseList = [];
  bool isOn = true;
  int index = 0;

  void setIndex(int i) {
    index = i;
    notifyListeners();
  }

  List<ChapterModel> chapterList = [];
  JsonHelper j1 = JsonHelper();

  bool theme = false;
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  IconData themeMode = Icons.dark_mode;

  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }

  Future<void> chapterData() async {
    List<ChapterModel> l3 = await j1.chapterData();
    chapterList = l3;

    notifyListeners();
  }

  void getVerse(int id) async {
    verseList.clear();
    List<ShlokModel> l1 = await j1.shlokData();
    for (var i = 0; i < l1.length; i++) {
      if (l1[i].chapter_number == id) {
        verseList.add(l1[i]);
      }
    }

    notifyListeners();
  }

  void setThemeData() async {
    theme = !theme;
    setData(isTheme: theme);
    isTheme = (await getData1())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void getThemeData() async {
    if (await getData1() == null) {
      isTheme = false;
    } else {
      isTheme = (await getData1())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }
}
