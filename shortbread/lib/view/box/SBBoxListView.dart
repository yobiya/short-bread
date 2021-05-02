import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatelessWidget {
  final Iterable<SBBoxViewData> _viewData;
  final int _selectedId;
  final void Function(int) onSelectBox;
  final void Function(int) onRequestEdit;

  SBBoxListView(
    this._viewData,
    this._selectedId,
    this.onSelectBox,
    this.onRequestEdit,
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
    var boxViewCollection = _viewData.map((data) => SBBoxView(
          data,
          (_selectedId == data.id),
          () => onSelectBox(data.id),
          () => onRequestEdit(data.id),
        ));

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }
}
