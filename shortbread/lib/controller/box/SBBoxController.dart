import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();
  int selectedId;
  void Function(int) onChangedSelectedBox = (id) {};

  SBBoxController() {
    var viewData = _boxModel.getViewData();
    selectedId = viewData.isNotEmpty ? viewData.first.id : 0;
  }

  Widget createView() {
    return SBBoxListView(
      _boxModel.getViewData(),
      selectedId,
      onSelectBox: _selectBox,
    );
  }

  void _selectBox(int id) {
    selectedId = id;

    onChangedSelectedBox(id);
  }
}
