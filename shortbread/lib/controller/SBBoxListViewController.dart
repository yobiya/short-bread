import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'package:shortbread/view/box/SBBoxView.dart';

class SBBoxListViewController {
  final Iterable<SBBoxData> _dataCollection;
  int _selectedId;
  Function _refreshView;
  Function _selectedBoxId;

  SBBoxListViewController(this._dataCollection, this._selectedId, this._refreshView, this._selectedBoxId,);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
/*      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _onPressedAddbutton,
      ),*/
    );
  }

  List<Widget> _buildContents() {
    var boxViewCollection = _dataCollection.map((data) {
      var delegates = SBBoxViewDelegates(
        () => _onSelectBox(data.id),
        null,
        null,
        //() => _onEdit(data.id),
        //() => _onDelete(data.id),
      );

      return SBBoxView(
        data,
        (_selectedId == data.id),
        delegates,
      );
    });

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }

  void _onSelectBox(int selectedId) {
    _selectedId = selectedId;
    _selectedBoxId(_selectedId);
    _refreshView();
  }
}

