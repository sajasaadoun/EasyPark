import 'package:flutter/material.dart';

import '../model/choose_model.dart';
import '../utils/constants_appoint.dart';
import 'choose_time.dart';

class ChooseTimeGroup extends StatelessWidget {
  final String title;
  final List<ChooseModel> list;

  const ChooseTimeGroup({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: mTitleTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Wrap(
          runSpacing: 12,
          spacing: 12,
          children: buildItem(),
        )
      ],
    );
  }

  List<Widget> buildItem() {
    List<Widget> widgets = [];
    for (ChooseModel item in list) {
      widgets.add(ChooseTime(
        time: item.time,
        check: item.check,
      ));
    }
    return widgets;
  }
}
