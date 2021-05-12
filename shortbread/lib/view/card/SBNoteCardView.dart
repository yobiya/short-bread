import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/card/SBCardData.dart';

class SBNoteCardViewDelegates extends SBBoxCardBaseViewDelegates {
  SBNoteCardViewDelegates(
    final void Function() onSelect,
    final void Function() onTapEditButton,
    final void Function() onTapDeleteButton,
  ) : super(
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );
}

class SBNoteCardView extends SBBoxCardBaseView {
  SBNoteCardView(
    SBNoteCardData data,
    bool selected,
    SBNoteCardViewDelegates delegates,
  ) : super(
          data.title,
          data.description,
          selected,
          delegates,
        );

  @override
  Widget buildContent(BuildContext context) {
    return Container();
  }
}
