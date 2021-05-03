import 'dart:io';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class FileModel {
  Directory _rootDirectory;
  Directory _boxDirectory;
  Directory _cardDirectory;

  FileModel() {
    _rootDirectory = Directory(Directory.current.path + '/short-bread-file');
    _boxDirectory = Directory(_rootDirectory.path + '/box');
    _cardDirectory = Directory(_rootDirectory.path + '/card');

    _rootDirectory.createSync();
    _boxDirectory.createSync();
    _cardDirectory.createSync();
  }

  Iterable<SBBoxData> readBoxes() {
    return _boxDirectory.listSync().map((entity) {
      var file = File(entity.path);
      var json = file.readAsStringSync();
      return SBBoxData.json(json);
    });
  }

  void writeBox(SBBoxData data) {
    var path = _boxDirectory.path + '/box-${data.id}.json';
    var file = File(path);

    file.writeAsStringSync(data.toJson());
  }

  void writeNoteCard(SBNoteCardData data) {
    var path = _cardDirectory.path + '/card-${data.id}-note.json';
    var file = File(path);

    file.writeAsStringSync(data.toJson());
  }
}
