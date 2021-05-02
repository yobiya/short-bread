import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxEditDialogView extends StatelessWidget {
  final SBBoxData _data;
  final void Function() _onCancel;
  final void Function(SBBoxData) _onDecide;

  SBBoxEditDialogView(this._data, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    var edittingViewData = SBBoxData(_data.id, _data.title, _data.description);

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
              controller: TextEditingController(text: _data.title),
              onChanged: (text) => edittingViewData.title = text,
            ),
            Container(height: 20),
            Scrollbar(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                controller: TextEditingController(text: _data.description),
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
