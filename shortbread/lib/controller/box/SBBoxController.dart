import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();
  SBBoxListView _boxListView;

  Widget createView() {
    _boxListView = SBBoxListView(
      _boxModel.getViewData(),
      onTapContent: _selectBox,
    );

    return _boxListView;
  }

  void _selectBox(int id) {}
}
