import 'dart:math';

import 'package:shortbread/model/FileModel.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxModel {
  static const int invalidId = -1;

  final FileModel _fileModel;
  List<SBBoxData> _dataList;

  SBBoxModel(this._fileModel) {
    _dataList = _fileModel.readBoxes().toList();
  }

  SBBoxData createData() {
    int maxId = 0;
    for (var data in _dataList) {
      maxId = max(maxId, data.id);
    }

    return SBBoxData(maxId + 1, '', '');
  }

  Iterable<SBBoxData> getDataCollection() => _dataList;

  void setData(SBBoxData data) {
    var targetDataCollection = _dataList.where((d) => d.id == data.id);
    if (targetDataCollection.isEmpty) {
      // 対象のデータが無かったので追加する
      _dataList.add(data);
    } else {
      // 対象のデータが見つかったので更新する
      var targetData = targetDataCollection.first;

      targetData.title = data.title;
      targetData.description = data.description;
    }

    _fileModel.writeBox(data);
  }

  void deleteData(int id) {
    _dataList.removeWhere((data) => data.id == id);

    _fileModel.deleteBox(id);
  }
}
