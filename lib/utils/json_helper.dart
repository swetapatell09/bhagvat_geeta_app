import 'dart:convert';

import 'package:flutter/services.dart';

import '../screen/home/model/home_model.dart';

class JsonHelper {
  Future<List<ShlokModel>> shlokData() async {
    String jsonString = await rootBundle.loadString("assets/json/verses.json");
    List jsonList = jsonDecode(jsonString);
    List<ShlokModel> list =
        jsonList.map((e) => ShlokModel.mapToModel(e)).toList();
    return list;
  }

  Future<List<ChapterModel>> chapterData() async {
    String jsonString = await rootBundle.loadString("assets/json/chapter.json");
    List jsonList = jsonDecode(jsonString);
    List<ChapterModel> list =
        jsonList.map((e) => ChapterModel.mapToModel(e)).toList();
    return list;
  }
}
