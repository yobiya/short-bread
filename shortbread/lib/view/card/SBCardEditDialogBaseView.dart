import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

abstract class SBCardEditDialogBaseView extends StatelessWidget {
  final String _name;
  final void Function() _onCancel;
  final void Function(SBCardBaseData) _onDecide;

  SBCardEditDialogBaseView(this._name, this._onCancel, this._onDecide);

  @override
  Widget build(BuildContext context) {
    var edittingData = getEdittingData();

    return AlertDialog(
      title: Text(_name),
      content: Container(
        width: 400,
        height: 420,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              minLines: 1,
              controller: TextEditingController(text: edittingData.title),
              onChanged: (text) => edittingData.title = text,
            ),
            ...buildContexts(),
            Container(height: 20),
            Scrollbar(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                controller: TextEditingController(text: edittingData.description),
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

  SBCardBaseData getEdittingData();

  Iterable<Widget> buildContexts();
}
