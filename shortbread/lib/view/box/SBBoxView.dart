import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxViewDelegates extends SBBoxCardBaseViewDelegates {
  SBBoxViewDelegates(
    final void Function() onSelect,
    final void Function() onTapEditButton,
    final void Function() onTapDeleteButton,
  ) : super(
          onSelect,
          onTapEditButton,
          onTapDeleteButton,
        );
}

class SBBoxView extends SBBoxCardBaseView {
  SBBoxView(
    SBBoxData data,
    bool selected,
    SBBoxViewDelegates delegates,
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
