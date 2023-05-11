import 'package:easypark/model/doctor_static_model.dart';
import 'package:easypark/provider/doctor_provider.dart';
import 'package:easypark/screens/appointment_screen.dart';
import 'package:easypark/screens/my_appointments_screen.dart';
import 'package:easypark/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/doctor_info_model.dart';
import '../utils/light_color.dart';
import '../utils/text_style.dart';
import '../utils/theme.dart';
import '../widgets/progress_widget.dart';
import '../widgets/rating_start.dart';

class DoctorInfo extends ConsumerStatefulWidget {
  // final DoctorModel model;
  // DoctorInfo({Key? key, required this.model}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends ConsumerState<DoctorInfo> {
  late DoctorModel model;
  @override
  void initState() {
    // model = widget.model;
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        // IconButton(
        //     icon: Icon(
        //       model.isfavourite ? Icons.favorite : Icons.favorite_border,
        //       color: model.isfavourite ? Colors.red : LightColor.grey,
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         model.isfavourite = !model.isfavourite;
        //       });
        //     })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final DoctorData = ref.watch(doctorsDataProvider);
    final index = ModalRoute.of(context)!.settings.arguments; //
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
        backgroundColor: LightColor.extraLightBlue,
        body: DoctorData.when(
          data: (value) => SafeArea(
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/images/doctor_1.jpg",
                  ),
                  DraggableScrollableSheet(
                    maxChildSize: .8,
                    initialChildSize: .6,
                    minChildSize: .6,
                    builder: (context, scrollController) {
                      return Container(
                        height: AppTheme.fullHeight(context) * .5,
                        padding: const EdgeInsets.only(
                            left: 19,
                            right: 19,
                            top: 16), //symmetric(horizontal: 19, vertical: 16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${value.docs[index].get('name')}",
                                      style: titleStyle,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.check_circle,
                                        size: 18,
                                        color: Theme.of(context).primaryColor),
                                    const Spacer(),
                                    RatingStar(
                                      rating: 4.5,
                                    )
                                  ],
                                ),
                                subtitle: Text(
                                  "${value.docs[index].get('location')}",
                                  style: TextStyles.bodySm.subTitleColor.bold,
                                ),
                              ),
                              const Divider(
                                thickness: .3,
                                color: LightColor.grey,
                              ),
                              Row(
                                children: <Widget>[
                                  ProgressWidget(
                                    value: 79.2,
                                    totalValue: 100,
                                    activeColor: LightColor.purpleExtraLight,
                                    backgroundColor:
                                        LightColor.grey.withOpacity(.3),
                                    title: "Good Review",
                                    durationTime: 500,
                                  ),
                                  ProgressWidget(
                                    value: 93.2,
                                    totalValue: 100,
                                    activeColor: LightColor.purpleLight,
                                    backgroundColor:
                                        LightColor.grey.withOpacity(.3),
                                    title: "Total Score",
                                    durationTime: 300,
                                  ),
                                  ProgressWidget(
                                    value: 85.2,
                                    totalValue: 100,
                                    activeColor: LightColor.purple,
                                    backgroundColor:
                                        LightColor.grey.withOpacity(.3),
                                    title: "Satisfaction",
                                    durationTime: 800,
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: .3,
                                color: LightColor.grey,
                              ),
                              Text("About", style: titleStyle).vP16,
                              Text(
                                "${value.docs[index].get('location')}",
                                style: TextStyles.body.subTitleColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          LightColor.lightBlue.withAlpha(150),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Test'),
                                              content: Text(
                                                  "${value.docs[index].get('email')}"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: LightColor.grey.withAlpha(150),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('DR Email'),
                                              content: Text(
                                                  "${value.docs[index].get('phone')}"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.chat_bubble,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyAppointments()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Make an appointment",
                                      style: TextStyles.titleNormal.white,
                                    ).p(10),
                                  )
                                ],
                              ).vP16
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  _appbar(),
                ],
              ),
            ),
          ),
          error: (Object error, StackTrace stackTrace) {
            return const Text("Error loading your plans");
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
