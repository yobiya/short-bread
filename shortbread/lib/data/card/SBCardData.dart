class SBCardBaseData {
  int id;
  int boxId;
  String title;

  SBCardBaseData(this.id, this.boxId, this.title);
}

class SBNoteCardData extends SBCardBaseData {
  String text;

  SBNoteCardData(int id, int boxId, String title, this.text) : super(id, boxId, title);
}
