import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/card/SBCardViewData.dart';

class SBCardView extends StatelessWidget {
  final SBCardViewData _viewData;
  final bool _selected;
  final void Function() onTap;

  SBCardView(this._viewData, this._selected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _selected ? 10 : Theme.of(context).cardTheme.elevation,
      child: InkWell(
        onTap: this.onTap,
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
      ),
    );
  }
}
