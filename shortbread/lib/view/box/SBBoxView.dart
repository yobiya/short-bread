import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxView extends StatelessWidget {
  final SBBoxViewData _viewData;
  final bool _selected;
  final GestureTapCallback _onSelect;
  final VoidCallback _onTapEditButton;

  SBBoxView(
    this._viewData,
    this._selected,
    this._onSelect,
    this._onTapEditButton,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _selected ? 10 : Theme.of(context).cardTheme.elevation,
      child: InkWell(
        onTap: this._onSelect,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _viewData.title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.edit),
                    onPressed: _onTapEditButton,
                  ),
                ),
              ],
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
