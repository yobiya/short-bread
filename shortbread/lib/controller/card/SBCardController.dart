import 'package:flutter/widgets.dart';
import 'package:shortbread/model/card/SBCardModel.dart';
import 'package:shortbread/view/card/SBCardListView.dart';

class SBCardControllerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SBCardController();
  }
}

class SBCardController extends State<SBCardControllerView> {
  SBCardModel _cardModel = SBCardModel();

  @override
  Widget build(BuildContext context) {
    return SBCardListView(_cardModel.getViewData(1));
  }
}
