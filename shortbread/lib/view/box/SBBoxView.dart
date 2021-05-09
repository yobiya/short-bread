import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/box/SBBoxData.dart';

class SBBoxView extends StatelessWidget {
  static const _editMenuItemName = 'edit';
  static const _deleteMenuItemName = 'delete';

  final SBBoxData _data;
  final bool _selected;
  final GestureTapCallback _onSelect;
  final void Function() _onTapEditButton;
  final void Function() _onTapDeleteButton;

  SBBoxView(
    this._data,
    this._selected,
    this._onSelect,
    this._onTapEditButton,
    this._onTapDeleteButton,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _selected ? 6 : Theme.of(context).cardTheme.elevation,
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
                  onSelected: _onTappedMenuItem,
                  itemBuilder: _buildMenuItemList,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _data.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildMenuItemList(BuildContext context) {
    return const <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: _editMenuItemName,
        child: ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem<String>(
        value: _deleteMenuItemName,
        child: ListTile(
          leading: Icon(Icons.delete, color: Colors.redAccent),
          title: Text('Delete', style: TextStyle(color: Colors.redAccent)),
        ),
      ),
    ];
  }

  void _onTappedMenuItem(String itemName) {
    switch (itemName) {
      case _editMenuItemName:
        _onTapEditButton();
        break;
      case _deleteMenuItemName:
        _onTapDeleteButton();
        break;
    }
  }
}
