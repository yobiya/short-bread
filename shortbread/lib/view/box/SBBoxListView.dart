import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';
import 'package:shortbread/view/ColumnSpaceLayoutView.dart';
import 'SBBoxView.dart';

class SBBoxListView extends StatefulWidget {
  final Iterable<SBBoxViewData> _sbBoxViewDataList;
  final int _selectedId;
  final void Function(int) onSelectBox;

  SBBoxListView(this._sbBoxViewDataList, this._selectedId, {this.onSelectBox});

  @override
  State<StatefulWidget> createState() => SBBoxListViewState(_selectedId);
}

class SBBoxListViewState extends State<SBBoxListView> {
  int _selectedId;

  SBBoxListViewState(this._selectedId);

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
              (_selectedId == data.id),
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
      _selectedId = id;
    });
  }
}
