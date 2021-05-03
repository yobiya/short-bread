import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

abstract class SBCardBaseView extends StatelessWidget {
  final SBCardBaseData _data;
  final bool _selected;
  final void Function() _onSelect;
  final void Function() _onTapEditButton;

  SBCardBaseView(
    this._data,
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
                        _data.title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Theme.of(context).buttonTheme.colorScheme.primary,
                  onPressed: _onTapEditButton,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.center,
              child: buildContent(context),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildContent(BuildContext context);
}
