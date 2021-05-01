import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();
  int _selectedBoxId;

  Widget createView() {
    var viewData = _boxModel.getViewData();
    _selectedBoxId = viewData.isNotEmpty ? viewData.first.id : 0;

    return SBBoxListView(
      _boxModel.getViewData(),
      _selectedBoxId,
      onSelectBox: _selectBox,
    );
  }

  void _selectBox(int id) {
    _selectedBoxId = id;
  }
}
