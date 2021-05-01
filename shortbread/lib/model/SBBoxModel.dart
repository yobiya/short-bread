import 'package:shortbread/view-data/SBBoxViewData.dart';

class SBBoxModel {
  List<SBBoxViewData> _viewData;

  Iterable<SBBoxViewData> getViewData() => _viewData;

  SBBoxModel() {
    _viewData = [
      SBBoxViewData('Box1', 'Description1'),
      SBBoxViewData('Box2', 'Description2'),
      SBBoxViewData('Box3', 'Description3'),
    ];
  }
}
