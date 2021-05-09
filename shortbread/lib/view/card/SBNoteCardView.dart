import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardBaseView.dart';

class SBNoteCardView extends SBCardBaseView {
  SBNoteCardView(
    SBNoteCardData data,
    bool selected,
    void Function() onSelect,
    void Function() onTapEditButton,
    void Function() onTapDeleteButton,
  ) : super(
          data,
          selected,
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );

  @override
  Widget buildContent(BuildContext context) {
    return Container();
  }
}
