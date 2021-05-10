import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBNoteCardView extends SBBoxCardBaseView {
  SBNoteCardView(
    SBNoteCardData data,
    bool selected,
    void Function() onSelect,
    void Function() onTapEditButton,
    void Function() onTapDeleteButton,
  ) : super(
          data.title,
          data.description,
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
