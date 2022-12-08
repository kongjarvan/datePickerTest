import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerTest extends StatefulWidget {
  const DatePickerTest({Key? key}) : super(key: key);

  @override
  State<DatePickerTest> createState() => _DatePickerTestState();
}

class _DatePickerTestState extends State<DatePickerTest> {
  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDatePickerPop();
          },
          child: Text('${DateFormat("yyyy-MM-dd").format(time)}'),
        ),
      ),
    );
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      currentDate: time,
      initialDate: time, //초기값
      firstDate: DateTime(2000), //시작일
      lastDate: DateTime(2099), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Colors.deepOrange),
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((dateTime) {
      setState(() {
        time = dateTime!;
      });
    });
  }
}
