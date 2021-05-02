import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxListView.dart';

class SBBoxControllerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SBBoxController();
  }
}

class SBBoxController extends State<SBBoxControllerView> {
  SBBoxModel _boxModel = SBBoxModel();
  int selectedId;

  SBBoxController() {
    var viewData = _boxModel.getViewData();
    selectedId = viewData.isNotEmpty ? viewData.first.id : 0;
  }

  @override
  Widget build(BuildContext context) {
    return SBBoxListView(
      _boxModel.getViewData(),
      selectedId,
      _selectBox,
      _showEditDialog,
    );
  }

  void _selectBox(int id) {
    setState(() {
      selectedId = id;
    });
  }

  void _showEditDialog(int id) {
    showDialog(
        context: context,
        builder: (context) {
          var viewData = _boxModel.getViewData();
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
