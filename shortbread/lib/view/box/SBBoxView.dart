import 'package:flutter/material.dart';
import 'package:shortbread/common/view/SBBoxCardBaseView.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxView extends SBBoxCardBaseView {
  SBBoxView(
    SBBoxData data,
    bool selected,
    GestureTapCallback onSelect,
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
