import 'dart:convert';

class SBCardBaseData {
  int id;
  int boxId;
  String title;

  SBCardBaseData(this.id, this.boxId, this.title);

  SBCardBaseData.copy(SBCardBaseData source)
      : id = source.id,
        boxId = source.boxId,
        title = source.title;
}

class SBNoteCardData extends SBCardBaseData {
  String note;

  SBNoteCardData(int id, int boxId, String title, this.note) : super(id, boxId, title);

  SBNoteCardData.copy(SBNoteCardData source)
      : note = source.note,
        super.copy(source);

  String toJson() {
    var source = {
      'type': 'note',
      'id': id,
      'title': title,
      'note': note,
    };

    return jsonEncode(source);
  }
}
