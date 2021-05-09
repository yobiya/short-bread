import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardEditDialogBaseView.dart';

class SBNoteCardEditDialogView extends SBCardEditDialogBaseView {
  final SBNoteCardData _edittingData;

  SBNoteCardEditDialogView(
    String name,
    SBNoteCardData data,
    void Function() onCancel,
    void Function(SBCardBaseData) onDecide,
  )   : _edittingData = SBNoteCardData.copy(data),
        super(name, onCancel, onDecide);

  @override
  SBCardBaseData getEdittingData() => _edittingData;

  @override
  Iterable<Widget> buildContexts() {
    return [
      Scrollbar(
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Note',
          ),
          controller: TextEditingController(text: _edittingData.description),
          keyboardType: TextInputType.multiline,
          maxLines: 12,
          onChanged: (text) => _edittingData.description = text,
        ),
      ),
    ];
  }
}
