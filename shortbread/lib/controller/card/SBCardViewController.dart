import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/common/view/DeleteDialogView.dart';
import 'package:shortbread/common/view/MessageDialogView.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';
import 'package:shortbread/view/card/SBFolderCardEditDialogView.dart';
import 'package:shortbread/view/card/SBNoteCardEditDialog.dart';
import 'package:shortbread/view/card/SBUrlCardEditDialogView.dart';
import 'package:url_launcher/url_launcher.dart';

class SBCardViewControllerDelegates {
  final Delegate<int> onChangedBoxId;

  SBCardViewControllerDelegates(this.onChangedBoxId);
}

class SBCardViewController extends StatefulWidget {
  final SBCardViewControllerDelegates _delegates;
  final SBCardModel _cardModel;
  final int _selectedBoxId;
  final int _selectedCardId;

  SBCardViewController(
    this._delegates,
    this._cardModel,
    this._selectedBoxId,
    this._selectedCardId,
  );

  @override
  State<StatefulWidget> createState() {
    return _SBCardViewControllerState(_delegates, _selectedBoxId, _selectedCardId);
  }
}

class _SBCardViewControllerState extends State<SBCardViewController> {
  final SBCardViewControllerDelegates _delegates;
  int _selectedBoxId;
  int _selectedCardId;

  _SBCardViewControllerState(this._delegates, this._selectedBoxId, this._selectedCardId) {
    _delegates.onChangedBoxId.addReceiver((boxId) {
      setState(() {
        _selectedBoxId = boxId;

        final cardDataCollection = widget._cardModel.getDataCollection(_selectedBoxId);
        _selectedCardId = cardDataCollection.isEmpty ? SBCardModel.invalidId : cardDataCollection.first.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SBCardListView(
      widget._cardModel.getDataCollection(_selectedBoxId),
      _selectedCardId,
      _selectCard,
      _showNoteCardCreateDialog,
      _showNoteCardEditDialog,
      _showUrlCardCreateDialog,
      _showUrlCardEditDialog,
      _showFolderCardCreateDialog,
      _showFolderCardEditDialog,
      _showCardDeleteDialog,
      _openBrowser,
      _openFolder,
    );
  }

  void _selectCard(int id) {
    setState(() {
      _selectedCardId = id;
    });
  }

  void _showNoteCardCreateDialog() {
    var data = widget._cardModel.createNoteCardData(_selectedBoxId);

    showDialog(
      context: context,
      builder: (context) {
        return SBNoteCardEditDialogView(
          'New note card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showNoteCardEditDialog(SBNoteCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBNoteCardEditDialogView(
          'Edit note card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showUrlCardCreateDialog() {
    var data = widget._cardModel.createUrlCardData(_selectedBoxId);

    showDialog(
      context: context,
      builder: (context) {
        return SBUrlCardEditDialogView(
          'New URL card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showUrlCardEditDialog(SBUrlCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBUrlCardEditDialogView(
          'Edit URL card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showFolderCardCreateDialog() {
    var data = widget._cardModel.createFolderCardData(_selectedBoxId);

    showDialog(
      context: context,
      builder: (context) {
        return SBFolderCardEditDialogView(
          'New folder card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showFolderCardEditDialog(SBFolderCardData data) {
    showDialog(
      context: context,
      builder: (context) {
        return SBFolderCardEditDialogView(
          'Edit folder card',
          data,
          _closeDialog,
          _closeDialogAndSave,
        );
      },
    );
  }

  void _showCardDeleteDialog(SBCardBaseData data) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialogView(
          'Do you delete this card?',
          data.title,
          _closeDialog,
          () => _closeDialogAndDelete(data),
        );
      },
    );
  }

  void _closeDialog() {
    Navigator.of(context).pop(context);
  }

  void _closeDialogAndSave(SBCardBaseData data) {
    setState(() {
      widget._cardModel.setCardData(data);
    });

    _closeDialog();
  }

  void _closeDialogAndDelete(SBCardBaseData data) {
    setState(() {
      widget._cardModel.deleteCardData(data.id);
    });

    _closeDialog();
  }

  Future<bool> _openBrowser(String url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    }

    showDialog(
      context: context,
      builder: (context) {
        return MessageDialogView(
          'Can not open URL',
          url,
          _closeDialog,
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
