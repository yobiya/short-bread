import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBUrlCardEditDialogView extends StatelessWidget {
  final String _name;
  final SBUrlCardData _data;
  final void Function() _onCancel;
  final void Function(SBCardBaseData) _onDecide;

  SBUrlCardEditDialogView(this._name, this._data, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    var edittingData = SBUrlCardData.copy(_data);

    return AlertDialog(
      title: Text(_name),
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
              onChanged: (text) => edittingData.title = text,
            ),
            Container(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'URL',
              ),
              minLines: 1,
              controller: TextEditingController(text: _data.url),
              onChanged: (text) => edittingData.url = text,
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
                maxLines: 8,
                onChanged: (text) => edittingData.description = text,
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
          onPressed: () => _onDecide(edittingData),
          child: Text('OK'),
        ),
      ],
    );
  }
}
