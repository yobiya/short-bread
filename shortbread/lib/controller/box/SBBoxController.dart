import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();

  Widget createView() {
    return SBBoxListView(_boxModel.getViewData());
  }
}
