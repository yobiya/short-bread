import 'dart:convert';

class SBBoxViewData {
  int id;
  String title;
  String description;

  SBBoxViewData(this.id, this.title, this.description);

  SBBoxViewData.json(String json) {
    var data = jsonDecode(json);
    id = data['id'];
    title = data['title'];
    description = data['description'];
  }

  String toJson() {
    var source = {
      'id': id,
      'title': title,
      'description': description
    };

    return jsonEncode(source);
  }
}
