import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/FileModel.dart';

class SBCardModel {
  static const int invalidId = -1;

  final FileModel _fileModel;
  List<SBCardBaseData> _dataList;

  SBCardModel(this._fileModel) {
    _dataList = _fileModel.readCards().toList();
  }

  Iterable<SBCardBaseData> getDataCollection(int boxId) {
    return _dataList.where((data) => data.boxId == boxId);
  }

  void setNoteCardData(SBNoteCardData data) {
    var targetData = _dataList.singleWhere((d) => d.id == data.id);

    if (targetData is SBNoteCardData) {
      targetData.title = data.title;
      targetData.note = data.note;

      _fileModel.writeNoteCard(data);
    }
  }
}
