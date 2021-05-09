import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/data/card/SBCardData.dart';

abstract class SBCardBaseView extends StatelessWidget {
  static const _editMenuItemName = 'edit';
  static const _deleteMenuItemName = 'delete';

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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 4, 4, 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _data.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: _onTappedMenuItem,
                  itemBuilder: _buildMenuItemList,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(
              alignment: Alignment.center,
              child: buildContent(context),
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

  Widget buildContent(BuildContext context);
}
