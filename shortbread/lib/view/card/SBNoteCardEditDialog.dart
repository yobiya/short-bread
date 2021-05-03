import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBNoteCardEditDialogView extends StatelessWidget {
  final SBNoteCardData _data;
  final void Function() _onCancel;
  final void Function(SBNoteCardData) _onDecide;

  SBNoteCardEditDialogView(this._data, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    var edittingData = SBNoteCardData.copy(_data);

    return AlertDialog(
      title: Text('Edit note card'),
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
            Scrollbar(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Note',
                ),
                controller: TextEditingController(text: _data.note),
                keyboardType: TextInputType.multiline,
                maxLines: 12,
                onChanged: (text) => edittingData.note = text,
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
