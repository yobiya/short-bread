import 'package:shortbread/data/card/SBCardData.dart';

class SBCardModel {
  List<SBCardData> _dataList;

  SBCardModel() {
    _dataList = [
      SBCardData(1, 1, 'Card1', 'Path1'),
      SBCardData(2, 1, 'Card2', 'Path2'),
      SBCardData(3, 2, 'Card3', 'Path3'),
      SBCardData(4, 2, 'Card4', 'Path4'),
      SBCardData(5, 2, 'Card5', 'Path5'),
      SBCardData(6, 3, 'Card6', 'Path6'),
      SBCardData(7, 3, 'Card7', 'Path7'),
      SBCardData(8, 3, 'Card8', 'Path8'),
    ];
  }

  Iterable<SBCardData> getDataCollection(int boxId) {
    return _dataList.where((data) => data.boxId == boxId);
  }
}
