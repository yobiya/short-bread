import 'package:flutter/widgets.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';

class SBCardControllerDelegates {
  SBCardControllerDelegates();
}

class SBCardControllerView extends StatefulWidget {
  final SBCardControllerDelegates _delegates;
  final SBCardModel _cardModel;
  final int _startSelectedBoxId;

  SBCardControllerView(this._delegates, this._cardModel, this._startSelectedBoxId);

  @override
  State<StatefulWidget> createState() {
    return SBCardController(_startSelectedBoxId);
  }
}

class SBCardController extends State<SBCardControllerView> {
  final int _startSelectedBoxId;

  SBCardController(this._startSelectedBoxId);

  @override
  Widget build(BuildContext context) {
    return SBCardListView(widget._cardModel.getViewData(_startSelectedBoxId));
  }
}
