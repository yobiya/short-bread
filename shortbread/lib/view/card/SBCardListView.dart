import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shortbread/common/utility/CollectionUtility.dart';
import 'package:shortbread/data/card/SBCardData.dart';
import 'package:shortbread/view/card/SBNoteCardView.dart';

class SBCardListView extends StatelessWidget {
  final Iterable<SBCardBaseData> _dataCollection;
  final int _selectedId;
  final void Function(int) _onSelectCard;
  final void Function(SBNoteCardData) _onRequestNoteCardEdit;

  SBCardListView(
    this._dataCollection,
    this._selectedId,
    this._onSelectCard,
    this._onRequestNoteCardEdit,
  );

  @override
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
            children: _buildContents(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  List<Widget> _buildContents() {
    var boxViewCollection = _dataCollection.map(
      (data) => buildCardViewDispatch(
        data,
        (_selectedId == data.id),
        () => _onSelectCard(data.id),
      ),
    );

    return CollectionUtility.insertBetweenAll(
      boxViewCollection,
      Container(height: 8),
    ).toList();
  }

  Widget buildCardViewDispatch(SBCardBaseData data, bool selected, void Function() onSelect) {
    if (data is SBNoteCardData) {
      return SBNoteCardView(data, selected, onSelect, () => _onRequestNoteCardEdit(data));
    }

    return Container();
  }
}
