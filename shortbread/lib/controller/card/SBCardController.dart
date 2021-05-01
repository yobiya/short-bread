import 'package:flutter/widgets.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';

class SBCardController {
  SBCardModel _cardModel = SBCardModel();

  Widget createView(int boxId) {
    return SBCardListView(_cardModel.getViewData(boxId));
  }
}
