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

  Iterable<SBCardBaseData> readCards() {
    return _cardDirectory.listSync().map((entity) {
      var file = File(entity.path);
      var json = file.readAsStringSync();
      return SBCardBaseData.json(json);
    });
  }

  void writeBox(SBBoxData data) {
    var path = _boxDirectory.path + '/box-${data.id}.json';
    var file = File(path);

    file.writeAsStringSync(data.toJson());
  }

  void deleteBox(int id) {
    final file = File(_createBoxFilePath(id));

    file.delete();
  }

  void writeCard(SBCardBaseData data) {
    final file = File(_createCardFilePath(data.id));

    file.writeAsStringSync(data.toJson());
  }

  void deleteCard(int id) {
    final file = File(_createCardFilePath(id));

    file.delete();
  }

  String _createBoxFilePath(int id) => _boxDirectory.path + '/box-$id.json';

  String _createCardFilePath(int id) => _cardDirectory.path + '/card-$id.json';
}
