import 'package:shortbread/model/FileModel.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxModel {
  static const int invalidId = -1;

  final FileModel _fileModel;
  List<SBBoxData> _dataList;

  SBBoxModel(this._fileModel) {
    _dataList = _fileModel.readBoxes().toList();
  }

  Iterable<SBBoxData> getDataCollection() => _dataList;

  void setData(SBBoxData data) {
    var targetData = _dataList.singleWhere((d) => d.id == data.id);
    targetData.title = data.title;
    targetData.description = data.description;

    _fileModel.writeBox(data);
  }
}
