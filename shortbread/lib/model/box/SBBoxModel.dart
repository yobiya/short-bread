import 'package:shortbread/model/FileModel.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxModel {
  FileModel _fileModel;
  List<SBBoxViewData> _viewData;

  SBBoxModel(this._fileModel) {
    _viewData = [
      SBBoxViewData(1, 'Box1', 'Description1'),
      SBBoxViewData(2, 'Box2', 'Description2'),
      SBBoxViewData(3, 'Box3', 'Description3'),
    ];
  }

  Iterable<SBBoxViewData> getViewData() => _viewData;

  void setViewData(SBBoxViewData viewData) {
    var targetViewData = _viewData.singleWhere((data) => data.id == viewData.id);
    targetViewData.title = viewData.title;
    targetViewData.description = viewData.description;

    _fileModel.writeBox(viewData);
  }
}
