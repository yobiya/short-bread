import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxModel {
  List<SBBoxViewData> _viewData;

  Iterable<SBBoxViewData> getViewData() => _viewData;

  SBBoxModel() {
    _viewData = [
      SBBoxViewData(1, 'Box1', 'Description1'),
      SBBoxViewData(2, 'Box2', 'Description2'),
      SBBoxViewData(3, 'Box3', 'Description3'),
    ];
  }
}
