import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();

  int selectedBoxId;
  void Function(int) onChangedSelectedBox = (id) {};

  SBBoxController() {
    var viewData = _boxModel.getViewData();
    selectedBoxId = viewData.isNotEmpty ? viewData.first.id : 0;
  }

  Widget createView() {
    return SBBoxListView(
      _boxModel.getViewData(),
      selectedBoxId,
      onSelectBox: _selectBox,
    );
  }

  void _selectBox(int id) {
    selectedBoxId = id;

    onChangedSelectedBox(id);
  }
}
