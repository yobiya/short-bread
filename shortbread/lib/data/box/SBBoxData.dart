import 'dart:convert';

class SBBoxData {
  static const String jsonKeyId = 'id';
  static const String jsonKeyTitle = 'title';
  static const String jsonKeyDescription = 'description';

  int id;
  String title;
  String description;

  SBBoxData(this.id, this.title, this.description);

  SBBoxData.copy(SBBoxData source)
      : id = source.id,
        title = source.title,
        description = source.description;

  SBBoxData.json(String json) {
    var jsonMap = jsonDecode(json);
    id = jsonMap[jsonKeyId];
    title = jsonMap[jsonKeyTitle];
    description = jsonMap[jsonKeyDescription];
  }

  String toJson() {
    var source = {
      jsonKeyId: id,
      jsonKeyTitle: title,
      jsonKeyDescription: description
    };

    return jsonEncode(source);
  }
}
