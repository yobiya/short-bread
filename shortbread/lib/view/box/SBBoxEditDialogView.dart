import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxEditDialogView extends StatelessWidget {
  final SBBoxViewData _viewData;
  final void Function() _onCancel;
  final void Function(String, String) _onDecide;

  SBBoxEditDialogView(this._viewData, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    String _title = _viewData.title;
    String _description = _viewData.description;

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
              controller: TextEditingController(text: _viewData.title),
              onChanged: (text) => _title = text,
            ),
            Container(height: 20),
            Scrollbar(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                controller: TextEditingController(text: _viewData.description),
                keyboardType: TextInputType.multiline,
                maxLines: 12,
                onChanged: (text) => _description = text,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _onCancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => _onDecide(_title, _description),
          child: Text('OK'),
        ),
      ],
    );
  }
}
