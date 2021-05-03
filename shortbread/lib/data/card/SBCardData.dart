import 'dart:convert';

import 'package:shortbread/common/definition/CardDefinitions.dart';

class SBCardBaseData {
  static const String jsonKeyType = 'type';
  static const String jsonKeyId = 'id';
  static const String jsonKeyBoxId = 'box-id';
  static const String jsonKeyTitle = 'title';

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
  static const String jsonKeyNote = 'note';

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
