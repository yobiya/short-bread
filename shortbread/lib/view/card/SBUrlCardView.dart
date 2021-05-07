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
      Row(children: [
        Text(
          _data.url,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        IconButton(
          icon: Icon(Icons.open_in_browser),
          onPressed: _onTapOpenBrowserButton,
        ),
      ]),
      Text(
        _data.description,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }
}
