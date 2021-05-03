import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/view/card/SBCardView.dart';

class SBCardListView extends StatelessWidget {
  final Iterable<SBCardData> _dataCollection;
  final int _selectedId;
  final void Function(int) _onSelectCard;

  SBCardListView(this._dataCollection, this._selectedId, this._onSelectCard);

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
    var boxViewCollection = _dataCollection.map((data) => SBCardView(
          data,
          (_selectedId == data.id),
          () => _onSelectCard(data.id),
        ));

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }
}
