import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/view-data/card/SBCardViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'package:shortbread/view/card/SBCardView.dart';

class SBCardListView extends StatelessWidget {
  final Iterable<SBCardViewData> _viewData;

  SBCardListView(this._viewData);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        _viewData.map((data) => SBCardView(data)),
        4,
        2,
        2,
      ),
    );
  }
}
