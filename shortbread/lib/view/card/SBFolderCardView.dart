import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBFolderCardViewDelegates extends SBBoxCardBaseViewDelegates {
  final void Function() onTapOpenFolderButton;

  SBFolderCardViewDelegates(
    final void Function() onSelect,
    final void Function() onTapEditButton,
    final void Function() onTapDeleteButton,
    this.onTapOpenFolderButton,
  ) : super(
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );
}

class SBFolderCardView extends SBBoxCardBaseView {
  final SBFolderCardData _data;
  final SBFolderCardViewDelegates _delegates;

  SBFolderCardView(
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
              _data.path,
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ),
          IconButton(
            icon: Icon(Icons.folder_open),
            onPressed: _delegates.onTapOpenFolderButton,
          ),
        ]),
      ),
    ]);
  }
}
