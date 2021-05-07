import 'package:flutter/material.dart';

class MessageDialogView extends StatelessWidget {
  final String _title;
  final String _message;
  final void Function() _onClose;

  MessageDialogView(
    this._title,
    this._message,
    this._onClose,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _title,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: 400,
        height: 120,
        child: Text(
          _message,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
          onPressed: _onClose,
          child: Text('Close'),
        ),
      ],
    );
  }
}
