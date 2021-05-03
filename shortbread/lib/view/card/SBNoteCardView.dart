import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardBaseView.dart';

class SBNoteCardView extends SBCardBaseView {
  final SBNoteCardData _data;

  SBNoteCardView(
    this._data,
    bool selected,
    void Function() onSelect,
    void Function() onTapEditButton,
  ) : super(_data, selected, onSelect, onTapEditButton);

  @override
  Widget buildContent(BuildContext context) {
    return Text(
      _data.text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
