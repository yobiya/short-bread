import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/common/view/DeleteDialogView.dart';
import 'package:shortbread/data/box/SBBoxData.dart';
import 'package:shortbread/model/box/SBBoxModel.dart';
import 'package:shortbread/view/box/SBBoxEditDialogView.dart';
import 'package:shortbread/view/box/SBBoxView.dart';

class SBBoxListViewController {
  final SBBoxModel _boxModel;
  int _selectedId;
  Function _refreshView;
  Function _selectedBoxId;

  SBBoxListViewController(this._boxModel, this._selectedId, this._refreshView, this._selectedBoxId,);

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
            children: _buildContents(context),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showCreateDialog(context),
      ),
    );
  }

  List<Widget> _buildContents(BuildContext context) {
    var boxViewCollection = _boxModel.getDataCollection().map((data) {
      var delegates = SBBoxViewDelegates(
        () => _onSelectBox(data.id),
        () => _showEditDialog(context, data.id),
        () => _showDeleteDialog(context, data.id),
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

  void _showCreateDialog(BuildContext context) {
    final data = _boxModel.createData();

    showDialog(
        context: context,
        builder: (context) {
          return SBBoxEditDialogView(
            'New box',
            data,
            () => _closeDialog(context),
            (data) => _closeDialogAndSave(context, data),
          );
        });
  }

  void _showEditDialog(BuildContext context, int id) {
    final data = _boxModel.getDataCollection().singleWhere((data) => data.id == id);

    showDialog(
        context: context,
        builder: (context) {
          return SBBoxEditDialogView(
            'Edit box',
            data,
            () => _closeDialog(context),
            (data) => _closeDialogAndSave(context, data),
          );
        });
  }

  void _showDeleteDialog(BuildContext context, int id) {
    final data = _boxModel.getDataCollection().singleWhere((data) => data.id == id);

    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialogView(
          'Do you delete this box?',
          data.title,
          () => _closeDialog(context),
          () => _closeDialogAndDelete(context, id),
        );
      },
    );
  }

  void _closeDialog(BuildContext context) {
    Navigator.of(context).pop(context);
    _refreshView();
  }

  void _closeDialogAndSave(BuildContext context, SBBoxData data) {
    _boxModel.setData(data);
    _closeDialog(context);
  }

  void _closeDialogAndDelete(BuildContext context, int id) {
    _boxModel.deleteData(id);
    _closeDialog(context);
  }
}

