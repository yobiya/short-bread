import 'package:flutter/material.dart';
import 'package:shortbread/view-data/box/SBBoxViewData.dart';

class SBBoxView extends StatelessWidget {
  final SBBoxViewData _viewData;
  final GestureTapCallback onTap;

  SBBoxView(this._viewData, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: this.onTap,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _viewData.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _viewData.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
