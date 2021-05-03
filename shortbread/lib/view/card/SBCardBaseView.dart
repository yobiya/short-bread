import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

abstract class SBCardBaseView extends StatelessWidget {
  final SBCardBaseData _data;
  final bool _selected;
  final void Function() _onSelect;
  final void Function() _onTapEditButton;
  final void Function() _onTapDeleteButton;

  SBCardBaseView(
    this._data,
    this._selected,
    this._onSelect,
    this._onTapEditButton,
    this._onTapDeleteButton,
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
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: null,
                  itemBuilder: buildMenuItemList,
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

  List<PopupMenuItem<String>> buildMenuItemList(BuildContext context) {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: 'edit',
        child: TextButton.icon(
          label: Text('Edit'),
          icon: Icon(Icons.edit),
          onPressed: _onTapEditButton,
        ),
      ),
      PopupMenuItem<String>(
        value: 'delete',
        child: TextButton.icon(
          label: Text('Delete', style: const TextStyle(color: Colors.redAccent)),
          icon: Icon(Icons.delete, color: Colors.redAccent),
          onPressed: _onTapDeleteButton,
        ),
      ),
    ];
  }

  Widget buildContent(BuildContext context);
}
