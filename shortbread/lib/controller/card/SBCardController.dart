import 'package:flutter/widgets.dart';
import 'package:shortbread/common/utility/Delegate.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';

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
      _openEditDialog,
    );
  }

  void _selectedCard(int id) {
    setState(() {
      _selectedCardId = id;
    });
  }

  void _openEditDialog(int id) {}
}
