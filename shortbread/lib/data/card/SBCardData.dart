import 'dart:convert';

import 'package:shortbread/common/definition/CardDefinitions.dart';

abstract class SBCardBaseData {
  static const jsonKeyType = 'type';
  static const jsonKeyId = 'id';
  static const jsonKeyBoxId = 'box-id';
  static const jsonKeyTitle = 'title';
  static const jsonKeyDescription = 'description';

  int id;
  int boxId;
  String title;
  String description;

  SBCardBaseData(
    this.id,
    this.boxId,
    this.title,
    this.description,
  );

  SBCardBaseData.copy(SBCardBaseData source)
      : id = source.id,
        boxId = source.boxId,
        title = source.title,
        description = source.description;

  factory SBCardBaseData.json(String json) {
    var jsonMap = jsonDecode(json);
    var cardType = jsonMap[jsonKeyType];
    switch (cardType) {
      case SBCardTypes.note:
        return SBNoteCardData.jsonMap(jsonMap);
      case SBCardTypes.url:
        return SBUrlCardData.jsonMap(jsonMap);
      case SBCardTypes.folder:
        return SBFolderCardData.jsonMap(jsonMap);
    }

    return null;
  }

  SBCardBaseData.jsonMap(Map<String, Object> jsonMap)
      : id = jsonMap[jsonKeyId],
        boxId = jsonMap[jsonKeyBoxId],
        title = jsonMap[jsonKeyTitle],
        description = jsonMap[jsonKeyDescription];

  String toJson();

  Map<String, Object> createBaseJsonMap(String typeName) {
    var jsonMap = {
      jsonKeyType: typeName,
      jsonKeyId: id,
      jsonKeyBoxId: boxId,
      jsonKeyTitle: title,
      jsonKeyDescription: description,
    };

    return jsonMap;
  }
}

class SBNoteCardData extends SBCardBaseData {
  SBNoteCardData(
    int id,
    int boxId,
    String title,
    String description,
  ) : super(
          id,
          boxId,
          title,
          description,
        );

  SBNoteCardData.copy(SBNoteCardData source) : super.copy(source);

  SBNoteCardData.jsonMap(Map<String, Object> jsonMap) : super.jsonMap(jsonMap);

  @override
  String toJson() {
    var jsonMap = createBaseJsonMap(SBCardTypes.note);

    return jsonEncode(jsonMap);
  }
}

class SBUrlCardData extends SBCardBaseData {
  static const jsonKeyUrl = 'url';

  String url;

  SBUrlCardData(
    int id,
    int boxId,
    String title,
    String description,
    this.url,
  ) : super(
          id,
          boxId,
          title,
          description,
        );

  SBUrlCardData.copy(SBUrlCardData source)
      : url = source.url,
        super.copy(source);

  SBUrlCardData.jsonMap(Map<String, Object> jsonMap)
      : url = jsonMap[jsonKeyUrl],
        super.jsonMap(jsonMap);

  @override
  String toJson() {
    var jsonMap = createBaseJsonMap(SBCardTypes.url);
    jsonMap[jsonKeyUrl] = url;

    return jsonEncode(jsonMap);
  }
}

class SBFolderCardData extends SBCardBaseData {
  static const jsonKeyPath = 'path';

  String path;

  SBFolderCardData(
    int id,
    int boxId,
    String title,
    String description,
    this.path,
  ) : super(
          id,
          boxId,
          title,
          description,
        );

  SBFolderCardData.copy(SBFolderCardData source)
      : path = source.path,
        super.copy(source);

  SBFolderCardData.jsonMap(Map<String, Object> jsonMap)
      : path = jsonMap[jsonKeyPath],
        super.jsonMap(jsonMap);

  @override
  String toJson() {
    var jsonMap = createBaseJsonMap(SBCardTypes.folder);
    jsonMap[jsonKeyPath] = path;

    return jsonEncode(jsonMap);
  }
}
