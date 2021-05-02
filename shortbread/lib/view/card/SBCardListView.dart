import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/view/card/SBCardView.dart';

class SBCardListView extends StatefulWidget {
  final Iterable<SBCardData> _dataCollection;

  SBCardListView(this._dataCollection);

  @override
  State<StatefulWidget> createState() {
    return SBCardListViewState(this._dataCollection);
  }
}

class SBCardListViewState extends State<SBCardListView> {
  Iterable<SBCardData> _data;
  int _selectedId;

  SBCardListViewState(this._data) {
    _selectedId = _data.isNotEmpty ? _data.first.id : 0;
  }

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
    var boxViewCollection = widget._dataCollection.map((data) => SBCardView(
          data,
          (_selectedId == data.id),
          () => _selectCard(data.id),
        ));

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }

  void _selectCard(int id) {
    setState(() {
      _selectedId = id;
    });
  }
}
