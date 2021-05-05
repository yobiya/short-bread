import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatelessWidget {
  final Iterable<SBBoxData> _dataCollection;
  final int _selectedId;
  final void Function(int) _onSelectBox;
  final void Function() _onPressedAddbutton;
  final void Function(int) _onEdit;
  final void Function(int) _onDelete;

  SBBoxListView(
    this._dataCollection,
    this._selectedId,
    this._onSelectBox,
    this._onPressedAddbutton,
    this._onEdit,
    this._onDelete,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: _buildContents(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _onPressedAddbutton,
      ),
    );
  }

  List<Widget> _buildContents() {
    var boxViewCollection = _dataCollection.map((data) => SBBoxView(
          data,
          (_selectedId == data.id),
          () => _onSelectBox(data.id),
          () => _onEdit(data.id),
          () => _onDelete(data.id),
        ));

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }
}
