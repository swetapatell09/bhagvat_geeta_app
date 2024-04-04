class ShlokModel {
  String? name_sanskrit, name, text;
  int? chapter_number;

  ShlokModel({this.name_sanskrit, this.chapter_number, this.name, this.text});

  factory ShlokModel.mapToModel(Map m1) {
    return ShlokModel(
        name_sanskrit: m1['name_sanskrit'],
        chapter_number: m1['chapter_number'],
        name: m1['name'],
        text: m1['text']);
  }
}

class ChapterModel {
  int? chapter_number;
  String? text, name_sanskrit, imageUrl;
  ChapterModel(
      {this.text, this.name_sanskrit, this.chapter_number, this.imageUrl});

  factory ChapterModel.mapToModel(Map m1) {
    return ChapterModel(
        text: m1['text'],
        name_sanskrit: m1['name_sanskrit'],
        chapter_number: m1['chapter_number'],
        imageUrl: m1['imageUrl']);
  }
}
