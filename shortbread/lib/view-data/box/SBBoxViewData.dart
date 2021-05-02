class SBBoxViewData {
  int id;
  String title;
  String description;

  SBBoxViewData(this.id, this.title, this.description);

  String toJson() {
    return '{"id":"$id", "title":"$title", "description":"$description"}';
  }
}
