import 'dart:convert';

import 'package:shortbread/common/definition/CardDefinitions.dart';

abstract class SBCardBaseData {
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
      case SBCardTypes.url:
        return SBUrlCardData.jsonMap(jsonMap);
    }

    return null;
  }

  SBCardBaseData.jsonMap(Map<String, Object> jsonMap)
      : id = jsonMap[jsonKeyId],
        boxId = jsonMap[jsonKeyBoxId],
        title = jsonMap[jsonKeyTitle];

  String toJson();

  Map<String, Object> createBaseJsonMap(String typeName) {
    var jsonMap = {
      jsonKeyType: typeName,
      jsonKeyId: id,
      jsonKeyBoxId: boxId,
      jsonKeyTitle: title,
    };

    return jsonMap;
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

  @override
  String toJson() {
    var jsonMap = createBaseJsonMap(SBCardTypes.note);
    jsonMap[jsonKeyNote] = note;

    return jsonEncode(jsonMap);
  }
}

class SBUrlCardData extends SBCardBaseData {
  static const jsonKeyUrl = 'url';
  static const jsonKeyDescription = 'description';

  String url;
  String description;

  SBUrlCardData(
    int id,
    int boxId,
    String title,
    this.url,
    this.description,
  ) : super(id, boxId, title);

  SBUrlCardData.copy(SBUrlCardData source)
      : url = source.url,
        description = source.description,
        super.copy(source);

  SBUrlCardData.jsonMap(Map<String, Object> jsonMap)
      : url = jsonMap[jsonKeyUrl],
        description = jsonMap[jsonKeyDescription],
        super.jsonMap(jsonMap);

  @override
  String toJson() {
    var jsonMap = createBaseJsonMap(SBCardTypes.url);
    jsonMap[jsonKeyUrl] = url;
    jsonMap[jsonKeyDescription] = description;

    return jsonEncode(jsonMap);
  }
}
