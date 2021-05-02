import 'package:shortbread/model/FileModel.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxModel {
  FileModel _fileModel;
  List<SBBoxViewData> _viewData;

  SBBoxModel(this._fileModel) {
    _viewData = _fileModel.readBoxes().toList();
  }

  Iterable<SBBoxViewData> getViewData() => _viewData;

  void setViewData(SBBoxViewData viewData) {
    var targetViewData = _viewData.singleWhere((data) => data.id == viewData.id);
    targetViewData.title = viewData.title;
    targetViewData.description = viewData.description;

    _fileModel.writeBox(viewData);
  }
}
