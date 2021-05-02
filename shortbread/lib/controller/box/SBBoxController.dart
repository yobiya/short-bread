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
      );
    });
  }
}
