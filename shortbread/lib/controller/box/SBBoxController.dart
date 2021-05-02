import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'package:shortbread/view/box/SBBoxEditDialogView.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';
import 'package:shortbread/view/box/SBBoxView.dart';

class SBBoxControllerDeleagets {
  final Delegate<int> onChangedBoxId;

  SBBoxControllerDeleagets(this.onChangedBoxId);
}

class SBBoxControllerView extends StatefulWidget {
  final SBBoxControllerDeleagets _deleagets;
  final SBBoxModel _boxModel;
  final int _startSelectedId;

  SBBoxControllerView(this._deleagets, this._boxModel, this._startSelectedId);

  @override
  State<StatefulWidget> createState() {
    return SBBoxController(_deleagets, _startSelectedId);
  }
}

class SBBoxController extends State<SBBoxControllerView> {
  final SBBoxControllerDeleagets _deleagets;
  int _selectedId;

  SBBoxController(this._deleagets, this._selectedId);

  @override
  Widget build(BuildContext context) {
    return SBBoxListView(
      widget._boxModel.getViewData(),
      _selectedId,
      _selectBox,
      _showEditDialog,
    );
  }

  void _selectBox(int id) {
    _deleagets.onChangedBoxId(id);

    setState(() {
      _selectedId = id;
    });
  }

  void _showEditDialog(int id) {
    showDialog(
        context: context,
        builder: (context) {
          var viewData = widget._boxModel.getViewData().singleWhere((data) => data.id == id);
          return SBBoxEditDialogView(
            viewData,
            _closeDialog,
            _closeDialogAndSave,
          );
        });
  }

  void _closeDialog() {
    Navigator.of(context).pop(context);
  }

  void _closeDialogAndSave(SBBoxViewData viewData) {
    setState(() {
      widget._boxModel.setViewData(viewData);
    });

    _closeDialog();
  }
}
