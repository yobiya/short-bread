import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/card/SBCardViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'package:shortbread/view/card/SBCardView.dart';

class SBCardListView extends StatefulWidget {
  final Iterable<SBCardViewData> _viewData;

  SBCardListView(this._viewData);

  @override
  State<StatefulWidget> createState() {
    return SBCardListViewState(this._viewData);
  }
}

class SBCardListViewState extends State<SBCardListView> {
  Iterable<SBCardViewData> _viewData;
  int _selectedId;

  SBCardListViewState(this._viewData) {
    _selectedId = _viewData.isNotEmpty ? _viewData.first.id : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        widget._viewData.map(
          (data) => SBCardView(
            data,
            data.id == _selectedId,
            () => _selectCard(data.id),
          ),
        ),
        8,
        8,
        8,
      ),
    );
  }

  void _selectCard(int id) {
    setState(() {
      _selectedId = id;
    });
  }
}
