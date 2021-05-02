import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxController {
  SBBoxModel _boxModel = SBBoxModel();
  int selectedId;
  void Function(int) onChangedSelectedBox = (id) {};
  void Function(WidgetBuilder) showDialog = (builder) {};

  SBBoxController() {
    var viewData = _boxModel.getViewData();
    selectedId = viewData.isNotEmpty ? viewData.first.id : 0;
  }

  Widget buildView() {
    return SBBoxListView(
      _boxModel.getViewData(),
      selectedId,
      _selectBox,
      _showEditDialog,
    );
  }

  void _selectBox(int id) {
    selectedId = id;

    onChangedSelectedBox(id);
  }

  void _showEditDialog(int id) {
    this.showDialog((context) {
      return AlertDialog(
        title: Text('Edit box'),
      );
    });
  }
}
