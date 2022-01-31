import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/common/view/DeleteDialogView.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBNoteCardEditDialog.dart';
import 'package:shortbread/view/card/SBNoteCardView.dart';

class SBCardListViewController {
  final SBCardModel _cardModel;
  int _selectedBoxId;
  Function _refreshView;
  int _selectedCardId;

  SBCardListViewController(
    this._cardModel,
    this._selectedBoxId,
    this._refreshView,
  ) {
    _selectedCardId = 0;
  }

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
    );
  }

  List<Widget> _buildContents(BuildContext context) {
    var boxViewCollection = _cardModel.getDataCollection(_selectedBoxId).map(
          (data) => _buildCardView(
            context,
            data,
            (_selectedCardId == data.id),
          ),
        );

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }

  Widget _buildCardView(BuildContext context, SBCardBaseData data, bool selected) {
    Function onSelect = () {
      _selectedCardId = data.id;
      _refreshView();
    };

    if (data is SBNoteCardData) {
      var delegates = SBNoteCardViewDelegates(
        onSelect,
        () => _showNoteCardEditDialog(context, data),
        () => _showCardDeleteDialog(context, data),
      );

      return SBNoteCardView(
        data,
        selected,
        delegates,
      );
    }

    return Container();
  }

  void _showNoteCardEditDialog(BuildContext context, SBNoteCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBNoteCardEditDialogView(
          'Edit note card',
          data,
          () => _closeDialog(context),
          (data) => _closeDialogAndSave(context, data),
        );
      },
    );
  }

  void _showCardDeleteDialog(BuildContext context, SBCardBaseData data) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialogView(
          'Do you delete this card?',
          data.title,
          () => _closeDialog(context),
          () => _closeDialogAndDelete(context, data),
        );
      },
    );
  }

  void _closeDialog(BuildContext context) {
    Navigator.of(context).pop(context);
    _refreshView();
  }

  void _closeDialogAndSave(BuildContext context, SBCardBaseData data) {
    _cardModel.setCardData(data);
    _closeDialog(context);
  }

  void _closeDialogAndDelete(BuildContext context, SBCardBaseData data) {
    _cardModel.deleteCardData(data.id);
    _closeDialog(context);
  }
}

