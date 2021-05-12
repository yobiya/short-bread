import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardEditDialogBaseView.dart';

class SBUrlCardEditDialogView extends SBCardEditDialogBaseView {
  final SBUrlCardData _edittingData;

  SBUrlCardEditDialogView(
    String name,
    SBUrlCardData data,
    void Function() onCancel,
    void Function(SBCardBaseData) onDecide,
  )   : _edittingData = SBUrlCardData.copy(data),
        super(name, onCancel, onDecide);

  @override
  SBCardBaseData getEdittingData() => _edittingData;

  @override
  Iterable<Widget> buildContexts() {
    return [
      Container(height: 20),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'URL',
        ),
        minLines: 1,
        controller: TextEditingController(text: _edittingData.url),
        onChanged: (text) => _edittingData.url = text,
      ),
    ];
  }
}
