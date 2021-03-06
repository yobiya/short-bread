import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SBBoxCardBaseViewDelegates {
  final void Function() onSelect;
  final void Function() onTapEditButton;
  final void Function() onTapDeleteButton;

  SBBoxCardBaseViewDelegates(
    this.onSelect,
    this.onTapEditButton,
    this.onTapDeleteButton,
  );
}

abstract class SBBoxCardBaseView extends StatelessWidget {
  static const _editMenuItemName = 'edit';
  static const _deleteMenuItemName = 'delete';

  final String _title;
  final String _description;
  final bool _selected;
  final SBBoxCardBaseViewDelegates _delegates;

  SBBoxCardBaseView(
    this._title,
    this._description,
    this._selected,
    this._delegates,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _selected ? 6 : Theme.of(context).cardTheme.elevation,
      child: InkWell(
        onTap: this._delegates.onSelect,
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
                      child: SelectableText(
                        _title,
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
          buildContent(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: SelectableText(
                _description,
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
        _delegates.onTapEditButton();
        break;
      case _deleteMenuItemName:
        _delegates.onTapDeleteButton();
        break;
    }
  }

  Widget buildContent(BuildContext context);
}
