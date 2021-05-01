import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatelessWidget {
  final Iterable<SBBoxViewData> _sbBoxViewDataList;
  final void Function(int) onTapContent;

  SBBoxListView(this._sbBoxViewDataList, {this.onTapContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        _sbBoxViewDataList.map((data) => SBBoxView(
              data,
              onTap: () => onTapContent(data.id),
            )),
        4,
        2,
        2,
      ),
    );
  }
}
