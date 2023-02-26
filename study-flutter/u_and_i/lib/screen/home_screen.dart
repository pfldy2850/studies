import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  DateTime now = DateTime.now();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime(now.year, now.month, now.day, 23, 59, 59),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(onHeartPressed: onHeartPressed, firstDay: firstDay, now: now),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;
  final DateTime now;

  const _DDay(
      {Key? key,
      required this.onHeartPressed,
      required this.firstDay,
      required this.now})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final DateTime now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          'U&I',
          style: TextTheme.headline1,
        ),
        const SizedBox(height: 16.0),
        Text(
          '우리 처음 만난 날',
          style: TextTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
        Text(
          '${firstDay.year}. ${firstDay.month} ${firstDay.day}',
          style: TextTheme.bodyText2,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          onPressed: onHeartPressed,
          iconSize: 60.0,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'D+${DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second).difference(firstDay).inDays + 1}',
          style: TextTheme.headline2,
        ),
        Text(
          'H+${DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second).difference(firstDay).inHours + 1}',
          style: TextTheme.headline2,
        ),
        Text(
          'S+${DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second).difference(firstDay).inSeconds + 1}',
          style: TextTheme.headline2,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          "asset/img/middle_image.png",
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
