import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/FileModel.dart';

class SBCardModel {
  static const int invalidId = -1;

  final FileModel _fileModel;
  List<SBCardBaseData> _dataList;

  SBCardModel(this._fileModel) {
    _dataList = <SBCardBaseData>[
      SBNoteCardData(1, 1, 'Card1', 'Note1'),
      SBNoteCardData(2, 1, 'Card2', 'Note2'),
      SBNoteCardData(3, 2, 'Card3', 'Note3'),
      SBNoteCardData(4, 2, 'Card4', 'Note4'),
      SBNoteCardData(5, 2, 'Card5', 'Note5'),
      SBNoteCardData(6, 3, 'Card6', 'Note6'),
      SBNoteCardData(7, 3, 'Card7', 'Note7'),
      SBNoteCardData(8, 3, 'Card8', 'Note8'),
    ];
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
