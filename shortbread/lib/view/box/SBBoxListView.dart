import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatelessWidget {
  final Iterable<SBBoxData> _dataCollection;
  final int _selectedId;
  final void Function(int) onSelectBox;
  final void Function(int) onEdit;

  SBBoxListView(
    this._dataCollection,
    this._selectedId,
    this.onSelectBox,
    this.onEdit,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  List<Widget> _buildContents() {
    var boxViewCollection = _dataCollection.map((data) => SBBoxView(
          data,
          (_selectedId == data.id),
          () => onSelectBox(data.id),
          () => onEdit(data.id),
        ));

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }
}
