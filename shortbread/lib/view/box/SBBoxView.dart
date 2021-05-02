import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxView extends StatelessWidget {
  final SBBoxViewData _viewData;
  final bool _selected;
  final GestureTapCallback _onSelect;

  SBBoxView(this._viewData, this._selected, this._onSelect);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _selected ? 10 : Theme.of(context).cardTheme.elevation,
      child: InkWell(
        onTap: this._onSelect,
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
                _viewData.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
