import 'package:flutter/material.dart';
import '../model/choose_model.dart';
import '../utils/constants_appoint.dart';
import '../widgets/choose_date.dart';
import '../widgets/choose_time_group.dart';
import '../widgets/my_appbar.dart';
import '../widgets/myheader_appointment.dart';
import '../widgets/user_info_appoint.dart';

class ReserveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 226,
            imageUrl: 'assets/images/avatar_head.png',
            child: Column(
              children: <Widget>[
                MyAppbar(),
                SizedBox(
                  height: 16,
                ),
                UserInfo(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [mBackgroundColor, mSecondBackgroundColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ChooseSlot(),
                    SizedBox(
                      height: 32,
                    ),
                    ChooseTimeGroup(
                      title: 'Morning',
                      list: [
                        ChooseModel('09.00 AM'),
                        ChooseModel('09.30 AM', check: true),
                        ChooseModel('10.30 AM'),
                        ChooseModel('11.00 AM'),
                        ChooseModel('11.30 AM'),
                        ChooseModel('12.00 AM'),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ChooseTimeGroup(
                      title: 'Afternoon',
                      list: [
                        ChooseModel('02.00 PM'),
                        ChooseModel('02.30 PM'),
                        ChooseModel('03.00 PM'),
                        ChooseModel('03.30 PM'),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ChooseTimeGroup(
                      title: 'Evening',
                      list: [
                        ChooseModel('06.00 PM'),
                        ChooseModel('06.30 PM'),
                        ChooseModel('07.00 PM'),
                        ChooseModel('07.30 PM'),
                        ChooseModel('08.00 PM'),
                        ChooseModel('08.30 PM'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseSlot extends StatelessWidget {
  const ChooseSlot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose Your Slot',
            style: TextStyle(
              color: mTitleTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ChooseDate(
                week: 'Mon',
                date: '26',
              ),
              ChooseDate(
                week: 'Tue',
                date: '27',
                check: true,
              ),
              ChooseDate(
                week: 'Wed',
                date: '28',
              ),
              ChooseDate(
                week: 'Thu',
                date: '29',
              ),
              ChooseDate(
                week: 'Fri',
                date: '30',
              ),
              ChooseDate(
                week: 'Sat',
                date: '31',
              ),
            ],
          )
        ],
      ),
    );
  }
}