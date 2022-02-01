import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/common/view/DeleteDialogView.dart';
import 'package:shortbread/common/view/MessageDialogView.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBFolderCardEditDialogView.dart';
import 'package:shortbread/view/card/SBFolderCardView.dart';
import 'package:shortbread/view/card/SBNoteCardEditDialog.dart';
import 'package:shortbread/view/card/SBNoteCardView.dart';
import 'package:shortbread/view/card/SBUrlCardEditDialogView.dart';
import 'package:shortbread/view/card/SBUrlCardView.dart';
import 'package:url_launcher/url_launcher.dart';

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

    if (data is SBUrlCardData) {
      var delegates = SBUrlCardViewDelegates(
        onSelect,
        () => _showUrlCardEditDialog(context, data),
        () => _showCardDeleteDialog(context, data),
        () => _openBrowser(context, data.url),
      );

      return SBUrlCardView(
        data,
        selected,
        delegates,
      );
    }

    if (data is SBFolderCardData) {
      var delegates = SBFolderCardViewDelegates(
        onSelect,
        () => _showFolderCardEditDialog(context, data),
        () => _showCardDeleteDialog(context, data),
        () => _openFolder(data.path),
      );

      return SBFolderCardView(
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

  void _showUrlCardEditDialog(BuildContext context, SBUrlCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBUrlCardEditDialogView(
          'Edit URL card',
          data,
          () => _closeDialog(context),
          (data) => _closeDialogAndSave(context, data),
        );
      },
    );
  }

  void _showFolderCardEditDialog(BuildContext context, SBFolderCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBFolderCardEditDialogView(
          'Edit folder card',
          data,
          () => _closeDialog(context),
          (data) => _closeDialogAndDelete(context, data),
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

  Future<bool> _openBrowser(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    }

    showDialog(
      context: context,
      builder: (context) {
        return MessageDialogView(
          'Can not open URL',
          url,
          () => _closeDialog(context),
        );
      },
    );

    return false;
  }

  Future<bool> _openFolder(String path) async {
    Process.start(
      'Explorer',
      [
        path,
      ],
    );

    return true;
  }
}
