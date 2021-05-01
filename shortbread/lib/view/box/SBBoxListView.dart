import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatefulWidget {
  final Iterable<SBBoxViewData> _sbBoxViewDataList;
  final int _focusBoxId;
  final void Function(int) onSelectBox;

  SBBoxListView(this._sbBoxViewDataList, this._focusBoxId, {this.onSelectBox});

  @override
  State<StatefulWidget> createState() => SBBoxListViewState(_focusBoxId);
}

class SBBoxListViewState extends State<SBBoxListView> {
  int _focusBoxId;

  SBBoxListViewState(this._focusBoxId);

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
    widget.onSelectBox(id);

    setState(() {
      _focusBoxId = id;
    });
  }
}
