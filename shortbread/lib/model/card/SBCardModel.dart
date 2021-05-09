import 'dart:math';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/FileModel.dart';

class SBCardModel {
  static const int invalidId = -1;

  final FileModel _fileModel;
  List<SBCardBaseData> _dataList;

  SBCardModel(this._fileModel) {
    _dataList = _fileModel.readCards().toList();
  }

  SBNoteCardData createNoteCardData(int boxId) {
    int maxId = 0;
    for (var data in _dataList) {
      maxId = max(maxId, data.id);
    }

    return SBNoteCardData(maxId + 1, boxId, '', '');
  }

  SBUrlCardData createUrlCardData(int boxId) {
    int maxId = 0;
    for (var data in _dataList) {
      maxId = max(maxId, data.id);
    }

    return SBUrlCardData(maxId + 1, boxId, '', '', '');
  }

  Iterable<SBCardBaseData> getDataCollection(int boxId) {
    return _dataList.where((data) => data.boxId == boxId);
  }

  void setCardData(SBCardBaseData data) {
    var targetDataCollection = _dataList.where((d) => d.id == data.id);

    if (targetDataCollection.isEmpty) {
      // 対象のデータが無かったので追加する
      _dataList.add(data);
    } else {
      // 対象のデータが見つかったので更新する
      var targetData = targetDataCollection.first;

      if (targetData is SBNoteCardData && data is SBNoteCardData) {
        targetData.title = data.title;
        targetData.description = data.description;
      } else if (targetData is SBUrlCardData && data is SBUrlCardData) {
        targetData.title = data.title;
        targetData.description = data.description;
        targetData.url = data.url;
      }
    }

    _fileModel.writeCard(data);
  }

  void deleteCardData(int id) {
    _dataList.removeWhere((data) => data.id == id);

    _fileModel.deleteCard(id);
  }
}
