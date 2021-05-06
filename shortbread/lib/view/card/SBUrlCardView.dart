import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'SBCardBaseView.dart';

class SBUrlCardView extends SBCardBaseView {
  final SBUrlCardData _data;

  SBUrlCardView(
    this._data,
    bool selected,
    void Function() onSelect,
    void Function() onTapEditButton,
    void Function() onTapDeleteButton,
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
      Text(
        _data.url,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      Text(
        _data.description,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }
}
