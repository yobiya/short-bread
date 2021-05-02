import 'dart:io';
import 'package:shortbread/data/box/SBBoxData.dart';

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
}
