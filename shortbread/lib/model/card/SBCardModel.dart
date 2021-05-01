import 'package:shortbread/view-data/card/SBCardViewData.dart';

class SBCardModel {
  List<SBCardViewData> _viewData;

  SBCardModel() {
    _viewData = [
      SBCardViewData(1, 'Card1', 'Path1'),
      SBCardViewData(1, 'Card2', 'Path2'),
      SBCardViewData(2, 'Card3', 'Path3'),
      SBCardViewData(2, 'Card4', 'Path4'),
      SBCardViewData(2, 'Card5', 'Path5'),
      SBCardViewData(3, 'Card6', 'Path6'),
      SBCardViewData(3, 'Card7', 'Path7'),
      SBCardViewData(3, 'Card8', 'Path8'),
    ];
  }

  Iterable<SBCardViewData> getViewData(int boxId) {
    return _viewData.where((data) => data.boxId == boxId);
  }
}
