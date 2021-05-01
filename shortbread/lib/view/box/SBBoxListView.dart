import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatefulWidget {
  final Iterable<SBBoxViewData> _sbBoxViewDataList;
  final void Function(int) onTapContent;

  SBBoxListView(this._sbBoxViewDataList, {this.onTapContent});

  @override
  State<StatefulWidget> createState() => SBBoxListViewState();
}

class SBBoxListViewState extends State<SBBoxListView> {
  int _focusBoxId = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ColumnSpaceLayoutView(
        widget._sbBoxViewDataList.map((data) => SBBoxView(
              data,
              (_focusBoxId == data.id),
              onTap: () => onTapContent(data.id),
            )),
        8,
        8,
        8,
      ),
    );
  }

  void onTapContent(int id) {
    widget.onTapContent(id);

    setState(() {
      _focusBoxId = id;
    });
  }
}
