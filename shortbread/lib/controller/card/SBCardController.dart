import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/common/view/DeleteDialogView.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';
import 'package:shortbread/view/card/SBNoteCardEditDialog.dart';

class SBCardControllerDelegates {
  final Delegate<int> onChangedBoxId;

  SBCardControllerDelegates(this.onChangedBoxId);
}

class SBCardControllerView extends StatefulWidget {
  final SBCardControllerDelegates _delegates;
  final SBCardModel _cardModel;
  final int _selectedBoxId;
  final int _selectedCardId;

  SBCardControllerView(
    this._delegates,
    this._cardModel,
    this._selectedBoxId,
    this._selectedCardId,
  );

  @override
  State<StatefulWidget> createState() {
    return _SBCardController(_delegates, _selectedBoxId, _selectedCardId);
  }
}

class _SBCardController extends State<SBCardControllerView> {
  final SBCardControllerDelegates _delegates;
  int _selectedBoxId;
  int _selectedCardId;

  _SBCardController(this._delegates, this._selectedBoxId, this._selectedCardId) {
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
      _selectedCard,
      _openNoteCardCreateDialog,
      _openNoteCardEditDialog,
      _openCardDeleteDialog,
    );
  }

  void _selectedCard(int id) {
    setState(() {
      _selectedCardId = id;
    });
  }

  void _openNoteCardCreateDialog() {
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

  void _openNoteCardEditDialog(SBNoteCardData data) {
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

  void _openCardDeleteDialog(SBCardBaseData data) {
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

  void _closeDialogAndSave(SBNoteCardData data) {
    setState(() {
      widget._cardModel.setNoteCardData(data);
    });

    _closeDialog();
  }

  void _closeDialogAndDelete(SBCardBaseData data) {
    setState(() {
      widget._cardModel.deleteCardData(data.id);
    });

    _closeDialog();
  }
}
