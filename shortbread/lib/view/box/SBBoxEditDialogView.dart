import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxEditDialogView extends StatelessWidget {
  final SBBoxViewData _viewData;
  final void Function() _onCancel;
  final void Function(SBBoxViewData) _onDecide;

  SBBoxEditDialogView(this._viewData, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    var edittingViewData = SBBoxViewData(_viewData.id, _viewData.title, _viewData.description);

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
              onChanged: (text) => edittingViewData.title = text,
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
                onChanged: (text) => edittingViewData.description = text,
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
          onPressed: () => _onDecide(edittingViewData),
          child: Text('OK'),
        ),
      ],
    );
  }
}
