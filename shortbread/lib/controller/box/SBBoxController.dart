import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'package:shortbread/view/box/SBBoxEditDialogView.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxControllerDeleagets {
  final Delegate<int> onChangedBoxId;

  SBBoxControllerDeleagets(this.onChangedBoxId);
}

class SBBoxControllerView extends StatefulWidget {
  final SBBoxControllerDeleagets _deleagets;
  final SBBoxModel _boxModel;
  final int _selectedId;

  SBBoxControllerView(this._deleagets, this._boxModel, this._selectedId);

  @override
  State<StatefulWidget> createState() {
    return _SBBoxController(_deleagets, _selectedId);
  }
}

class _SBBoxController extends State<SBBoxControllerView> {
  final SBBoxControllerDeleagets _deleagets;
  int _selectedId;

  _SBBoxController(this._deleagets, this._selectedId);

  @override
  Widget build(BuildContext context) {
    return SBBoxListView(
      widget._boxModel.getDataCollection(),
      _selectedId,
      _selectBox,
      _showCreateDialog,
      _showEditDialog,
    );
  }

  void _selectBox(int id) {
    _deleagets.onChangedBoxId(id);

    setState(() {
      _selectedId = id;
    });
  }

  void _showCreateDialog() {}

  void _showEditDialog(int id) {
    showDialog(
        context: context,
        builder: (context) {
          var boxData = widget._boxModel.getDataCollection().singleWhere((data) => data.id == id);
          return SBBoxEditDialogView(
            boxData,
            _closeDialog,
            _closeDialogAndSave,
          );
        });
  }

  void _closeDialog() {
    Navigator.of(context).pop(context);
  }

  void _closeDialogAndSave(SBBoxData data) {
    setState(() {
      widget._boxModel.setData(data);
    });

    _closeDialog();
  }
}
