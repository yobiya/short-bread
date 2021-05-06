import 'dart:convert';

import 'package:shortbread/common/definition/CardDefinitions.dart';

class SBCardBaseData {
  static const jsonKeyType = 'type';
  static const jsonKeyId = 'id';
  static const jsonKeyBoxId = 'box-id';
  static const jsonKeyTitle = 'title';

  int id;
  int boxId;
  String title;

  SBCardBaseData(this.id, this.boxId, this.title);

  SBCardBaseData.copy(SBCardBaseData source)
      : id = source.id,
        boxId = source.boxId,
        title = source.title;

  factory SBCardBaseData.json(String json) {
    var jsonMap = jsonDecode(json);
    var cardType = jsonMap[jsonKeyType];
    switch (cardType) {
      case SBCardTypes.note:
        return SBNoteCardData.jsonMap(jsonMap);
    }

    return null;
  }

  SBCardBaseData.jsonMap(Map<String, Object> jsonMap)
      : id = jsonMap[jsonKeyId],
        boxId = jsonMap[jsonKeyBoxId],
        title = jsonMap[jsonKeyTitle];

  Map<String, Object> createBaseJsonMap(String typeName) {
    var source = {
      jsonKeyType: SBCardTypes.note,
      jsonKeyId: id,
      jsonKeyBoxId: boxId,
      jsonKeyTitle: title,
    };

    return source;
  }
}

class SBNoteCardData extends SBCardBaseData {
  static const jsonKeyNote = 'note';

  String note;

  SBNoteCardData(int id, int boxId, String title, this.note) : super(id, boxId, title);

  SBNoteCardData.copy(SBNoteCardData source)
      : note = source.note,
        super.copy(source);

  SBNoteCardData.jsonMap(Map<String, Object> jsonMap)
      : note = jsonMap[jsonKeyNote],
        super.jsonMap(jsonMap);

  String toJson() {
    var source = createBaseJsonMap(SBCardTypes.note);
    source[jsonKeyNote] = note;

    return jsonEncode(source);
  }
}

class SBUrlCardData extends SBCardBaseData {
  static const jsonKeyUrl = 'url';

  String url;

  SBUrlCardData(int id, int boxId, String title, this.url) : super(id, boxId, title);

  SBUrlCardData.copy(SBUrlCardData source)
      : url = source.url,
        super.copy(source);

  SBUrlCardData.jsonMap(Map<String, Object> jsonMap)
      : url = jsonMap[jsonKeyUrl],
        super.jsonMap(jsonMap);

  String toJson() {
    var source = createBaseJsonMap(SBCardTypes.url);
    source[jsonKeyUrl] = url;

    return jsonEncode(source);
  }
}
