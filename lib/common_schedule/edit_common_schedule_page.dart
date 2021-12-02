// flutter
import 'package:My_Day_app/public/loadUid.dart';
import 'package:flutter/material.dart';
// my day
import 'package:My_Day_app/common_schedule/common_schedule_form.dart';
import 'package:My_Day_app/main.dart';
import 'package:My_Day_app/models/group/get_common_schedule_model.dart';
import 'package:My_Day_app/public/schedule_request/get_common.dart';

class EditCommonSchedulePage extends StatefulWidget {
  int scheduleNum;

  EditCommonSchedulePage({this.scheduleNum});
  @override
  State<EditCommonSchedulePage> createState() =>
      _EditCommonSchedulePage(this.scheduleNum);
}

class _EditCommonSchedulePage extends State<EditCommonSchedulePage>
    with RouteAware {
  String uid = 'lili123';
  int scheduleNum;
  _EditCommonSchedulePage(this.scheduleNum);

  GetCommonScheduleModel data;
  List _typeNameList = <String>['讀書', '工作', '會議', '休閒', '社團', '吃飯', '班級', '個人'];

  @override
  void initState() {
    super.initState();
    _getCommonScheduleRequest();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  _getCommonScheduleRequest() async {
    // var response =
    //     await rootBundle.loadString('assets/json/get_common_schedule.json');
    // var responseBody = json.decode(response);

    GetCommonScheduleModel _request =
        await GetCommon(uid: uid, scheduleNum: scheduleNum).getData();

    setState(() {
      data = _request;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      String title = data.title;
      DateTime startTime = data.startTime;
      DateTime endTime = data.endTime;
      int type = _typeNameList.indexOf(data.typeName) + 1;
      String place = data.place;

      return CommonScheduleForm(
        submitType: 'edit',
        scheduleNum: scheduleNum,
        title: title,
        startDateTime: startTime,
        endDateTime: endTime,
        type: type,
        location: place,
      );
    } else {
      return Container(
          color: Colors.white,
          child: SafeArea(child: Center(child: CircularProgressIndicator())));
    }
  }
}
