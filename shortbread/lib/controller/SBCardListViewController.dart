import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/model/card/SBCardModel.dart';

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
    return [];
  }
}

