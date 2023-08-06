import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime _dateTime=DateTime.now();
  TimeOfDay _timepic=TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date pick'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: ()async{
              DateTime? datepicker= await showDatePicker(context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate:DateTime(1990),
                  lastDate: DateTime(2024)
              );
              if(datepicker!=null){
                _dateTime=datepicker;
               var mydate= '${datepicker.day}-${datepicker.month}-${datepicker.year}';
                setState(() {
                  print('my print $mydate');
                });
              }
            },
            child: Text('click '),
          ),
          Center(
              child: Text(
                  "${_dateTime.toString()}".split(" ")[0])),
          ElevatedButton(
            onPressed: ()async{
            TimeOfDay? picktime =await showTimePicker(context: context,
                initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.dial);
              if(picktime!=null){
              _timepic=picktime;
              var mytime= '${picktime.hour}-${picktime.minute}';
              setState(() {
                print('my print $mytime');
              });
              }
            },
            child: Text('click '),
          ),
          Center(
              child: Text(
                  "${_timepic.toString()}")

    ),
        ],
      )
    );
  }
}
