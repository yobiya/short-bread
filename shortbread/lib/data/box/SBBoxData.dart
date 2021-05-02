import 'dart:convert';

class SBBoxData {
  int id;
  String title;
  String description;

  SBBoxData(this.id, this.title, this.description);

  SBBoxData.json(String json) {
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
