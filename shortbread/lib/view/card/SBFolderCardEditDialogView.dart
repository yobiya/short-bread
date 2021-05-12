import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardEditDialogBaseView.dart';

class SBFolderCardEditDialogView extends SBCardEditDialogBaseView {
  final SBFolderCardData _edittingData;

  SBFolderCardEditDialogView(
    String name,
    SBFolderCardData data,
    void Function() onCancel,
    void Function(SBCardBaseData) onDecide,
  )   : _edittingData = SBFolderCardData.copy(data),
        super(name, onCancel, onDecide);

  @override
  SBCardBaseData getEdittingData() => _edittingData;

  @override
  Iterable<Widget> buildContexts() {
    return [
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Folder path',
        ),
        minLines: 1,
        controller: TextEditingController(text: _edittingData.path),
        onChanged: (text) => _edittingData.path = text,
      ),
      Container(height: 20),
      Scrollbar(
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Description',
          ),
          controller: TextEditingController(text: _edittingData.description),
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          onChanged: (text) => _edittingData.description = text,
        ),
      ),
    ];
  }
}
