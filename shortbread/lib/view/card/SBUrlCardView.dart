import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBUrlCardViewDelegates extends SBBoxCardBaseViewDelegates {
  final void Function() onTapOpenBrowserButton;

  SBUrlCardViewDelegates(
    final void Function() onSelect,
    final void Function() onTapEditButton,
    final void Function() onTapDeleteButton,
    this.onTapOpenBrowserButton,
  ) : super(
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );
}

class SBUrlCardView extends SBBoxCardBaseView {
  final SBUrlCardData _data;
  final SBUrlCardViewDelegates _delegates;

  SBUrlCardView(
    this._data,
    bool selected,
    this._delegates,
  ) : super(
          _data.title,
          _data.description,
          selected,
          _delegates,
        );

  @override
  Widget buildContent(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(16, 4, 8, 4),
        child: Row(children: [
          Expanded(
            child: SelectableText(
              _data.url,
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ),
          IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: _delegates.onTapOpenBrowserButton,
          ),
        ]),
      ),
    ]);
  }
}
