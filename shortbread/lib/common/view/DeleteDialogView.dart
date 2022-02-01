import 'package:flutter/material.dart';

class DeleteDialogView extends StatelessWidget {
  final String _title;
  final String _targetNeme;
  final void Function() _onCancel;
  final void Function() _onDelete;

  DeleteDialogView(
    this._title,
    this._targetNeme,
    this._onCancel,
    this._onDelete,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _title,
        style: const TextStyle(color: Colors.redAccent),
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 300,
        height: 220,
        child: Text(
          _targetNeme,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
          onPressed: _onCancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _onDelete,
          child: Text(
            'Delete',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
