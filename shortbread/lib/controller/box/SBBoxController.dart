import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

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
          var viewData = widget._boxModel.getViewData();
          var data = viewData.singleWhere((data) => data.id == id);

          return AlertDialog(
            title: Text('Edit box'),
            content: Container(
              width: 400,
              height: 420,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    minLines: 1,
                    controller: TextEditingController(text: data.title),
                  ),
                  Container(height: 20),
                  Scrollbar(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                      controller: TextEditingController(text: data.description),
                      keyboardType: TextInputType.multiline,
                      maxLines: 12,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: _closeDialog,
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: _closeDialogAndSave,
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  void _closeDialog() {
    Navigator.of(context).pop(context);
  }

  void _closeDialogAndSave() {
    _closeDialog();
  }
}
