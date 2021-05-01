import 'package:flutter/material.dart';
import 'package:shortbread/view-data/SBBoxViewData.dart';
import 'package:shortbread/view/SBBoxView.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';

class SBBoxListView extends StatelessWidget {
  final Iterable<SBBoxViewData> _sbBoxViewDataList;

  SBBoxListView(this._sbBoxViewDataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        _sbBoxViewDataList.map((data) => SBBoxView(data)),
        4,
        2,
        2,
      ),
    );
  }
}
