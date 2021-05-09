import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardBaseView.dart';

class SBUrlCardView extends SBCardBaseView {
  final SBUrlCardData _data;
  final void Function() _onTapOpenBrowserButton;

  SBUrlCardView(
    this._data,
    bool selected,
    void Function() onSelect,
    void Function() onTapEditButton,
    void Function() onTapDeleteButton,
    this._onTapOpenBrowserButton,
  ) : super(
          _data,
          selected,
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );

  @override
  Widget buildContent(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(16, 4, 8, 4),
        child: Row(children: [
          Expanded(
            child: Text(
              _data.url,
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ),
          IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: _onTapOpenBrowserButton,
          ),
        ]),
      ),
    ]);
  }
}
