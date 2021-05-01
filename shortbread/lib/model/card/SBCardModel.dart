import 'package:shortbread/view-data/card/SBCardViewData.dart';

class SBCardModel {
  List<SBCardViewData> _viewData;

  Iterable<SBCardViewData> getViewData() => _viewData;

  SBCardModel() {
    _viewData = [
      SBCardViewData('Card1', 'Path1'),
      SBCardViewData('Card2', 'Path2'),
      SBCardViewData('Card3', 'Path3'),
      SBCardViewData('Card4', 'Path4'),
      SBCardViewData('Card5', 'Path5'),
    ];
  }
}
