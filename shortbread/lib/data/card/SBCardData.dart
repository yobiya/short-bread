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
  String text;

  SBNoteCardData(int id, int boxId, String title, this.text) : super(id, boxId, title);
}
