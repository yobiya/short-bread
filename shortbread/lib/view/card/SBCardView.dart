import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/card/SBCardViewData.dart';

class SBCardView extends StatelessWidget {
  final SBCardViewData _viewData;

  SBCardView(this._viewData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _viewData.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              _viewData.path,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ]),
    );
  }
}
