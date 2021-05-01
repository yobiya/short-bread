import 'package:shortbread/view-data/card/SBCardViewData.dart';

class SBCardModel {
  List<SBCardViewData> _viewData;

  SBCardModel() {
    _viewData = [
      SBCardViewData(1, 1, 'Card1', 'Path1'),
      SBCardViewData(2, 1, 'Card2', 'Path2'),
      SBCardViewData(3, 2, 'Card3', 'Path3'),
      SBCardViewData(4, 2, 'Card4', 'Path4'),
      SBCardViewData(5, 2, 'Card5', 'Path5'),
      SBCardViewData(6, 3, 'Card6', 'Path6'),
      SBCardViewData(7, 3, 'Card7', 'Path7'),
      SBCardViewData(8, 3, 'Card8', 'Path8'),
    ];
  }

  Iterable<SBCardViewData> getViewData(int boxId) {
    return _viewData.where((data) => data.boxId == boxId);
  }
}
