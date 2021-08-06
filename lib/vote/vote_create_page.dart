import 'package:My_Day_app/vote/vote_setting_page.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';

class VoteCreatePage extends StatefulWidget {
  int groupNum;
  VoteCreatePage(this.groupNum);

  @override
  _VoteCreateWidget createState() => new _VoteCreateWidget(groupNum);
}

class _VoteCreateWidget extends State<VoteCreatePage>
    with SingleTickerProviderStateMixin {
  int groupNum;
  _VoteCreateWidget(this.groupNum);

  TabController _tabController;

  final _voteTitleController = TextEditingController();
  final _voteDateTitleController = TextEditingController();
  List _voteValues = List.generate(2, (index) => "");
  List _voteDateValues = List.generate(2, (index) => "");
  List _voteDateFormat = List.generate(2, (index) => "");
  List _voteItems = [];
  List _voteItemsName = [];
  List _voteDateItems = [];
  List _voteDateItemsName = [];

  String _value = '';
  String _dateValue = '';
  TextEditingController get _voteItemController =>
      TextEditingController(text: _value);

  TextEditingController get _voteDateItemController =>
      TextEditingController(text: _dateValue);

  FocusNode _contentFocusNode = FocusNode();

  bool _isEnabled;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => {
          if (!_tabController.indexIsChanging)
            {_isEnabled = false, _buttonIsOnpressed()}
        });
    _buttonIsOnpressed();
  }

  _buttonIsOnpressed() {
    if (_tabController.index == 0) {
      int count = 0;
      for (int i = 0; i < _voteValues.length; i++) {
        if (_voteValues[i] != "") {
          count++;
        }
      }
      if (count < 2 || _voteTitleController.text.isEmpty) {
        setState(() {
          _isEnabled = false;
        });
      } else {
        setState(() {
          _isEnabled = true;
        });
      }
    }
    if (_tabController.index == 1) {
      int count = 0;
      for (int i = 0; i < _voteDateValues.length; i++) {
        if (_voteDateValues[i] != "") {
          count++;
        }
      }
      if (count < 2 || _voteDateTitleController.text.isEmpty) {
        setState(() {
          _isEnabled = false;
        });
      } else {
        setState(() {
          _isEnabled = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('建立投票',
              style: TextStyle(fontSize: screenSize.width * 0.052)),
          leading: Container(
            margin: EdgeInsets.only(left: screenSize.height * 0.02),
            child: GestureDetector(
              child: Icon(Icons.chevron_left),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xffEFB208),
                        width: 0,
                        style: BorderStyle.solid)),
                gradient: LinearGradient(
                    colors: [Color(0xffEFB208), Color(0xffEFB208)])),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xffe3e3e3),
            indicatorPadding: EdgeInsets.all(0.0),
            indicatorWeight: screenSize.width * 0.01,
            labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            tabs: <Widget>[
              Container(
                height: screenSize.height * 0.04683,
                alignment: Alignment.center,
                color: Theme.of(context).primaryColor,
                child: Text("選項",
                    style: TextStyle(fontSize: screenSize.width * 0.041)),
              ),
              Container(
                height: screenSize.height * 0.04683,
                alignment: Alignment.center,
                color: Theme.of(context).primaryColor,
                child: Text("日期",
                    style: TextStyle(fontSize: screenSize.width * 0.041)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _buildCreateVote(context),
            _buildCreateDateVote(context)
          ],
        ),
        bottomNavigationBar: _buildCheckButtom(context));
  }

  Widget _buildCreateVote(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(
          top: screenSize.height * 0.03,
          right: screenSize.height * 0.05,
          left: screenSize.height * 0.05),
      children: [
        TextField(
          controller: _voteTitleController,
          cursorColor: Colors.black,
          style: TextStyle(fontSize: screenSize.width * 0.06),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(screenSize.width * 0.02),
            hintText: '輸入投票問題',
            hintStyle: TextStyle(
                color: Color(0xffCCCCCC), fontSize: screenSize.width * 0.06),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffCCCCCC)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffCCCCCC)),
              //  when the TextFormField in focused
            ),
          ),
          onChanged: (text) {
            _buttonIsOnpressed();
          },
        ),
        _buildCreateVoteItem(context)
      ],
    );
  }

  Widget _buildCreateVoteItem(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int count = 0;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.03),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _voteValues.length,
      itemBuilder: (BuildContext context, int index) {
        _value = _voteValues[index];
        return Row(
          children: [
            Container(
                padding: EdgeInsets.all(screenSize.height * 0.0131),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffCCCCCC)),
                  ),
                ),
                margin: EdgeInsets.only(top: screenSize.height * 0.032),
                child: Text('${index + 1}.',
                    style: TextStyle(fontSize: screenSize.width * 0.05))),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.028),
                child: TextField(
                  controller: _voteItemController,
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: screenSize.width * 0.05),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(screenSize.width * 0.02),
                    hintText: '輸入選項',
                    hintStyle: TextStyle(
                        color: Color(0xffCCCCCC),
                        fontSize: screenSize.width * 0.05),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCCCCC)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCCCCC)),
                      //  when the TextFormField in focused
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _voteValues[index] = text;
                    });
                    _buttonIsOnpressed();
                    for (int i = 0; i < _voteValues.length; i++) {
                      if (_voteValues[i] == "") {
                        count++;
                      }
                    }
                    if (count == 0) {
                      setState(() {
                        _voteValues.add("");
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCreateDateVote(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(
          top: screenSize.height * 0.03,
          right: screenSize.height * 0.05,
          left: screenSize.height * 0.05),
      children: [
        TextField(
          controller: _voteDateTitleController,
          cursorColor: Colors.black,
          style: TextStyle(fontSize: screenSize.width * 0.06),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(screenSize.width * 0.02),
            hintText: '輸入投票問題',
            hintStyle: TextStyle(
                color: Color(0xffCCCCCC), fontSize: screenSize.width * 0.06),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffCCCCCC)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffCCCCCC)),
              //  when the TextFormField in focused
            ),
          ),
          onChanged: (text) {
            _buttonIsOnpressed();
          },
        ),
        _buildCreateDateVoteItem(context)
      ],
    );
  }

  Widget _buildCreateDateVoteItem(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int count = 0;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.03),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _voteDateValues.length,
      itemBuilder: (BuildContext context, int index) {
        _dateValue = _voteDateValues[index];
        return Row(
          children: [
            Container(
                padding: EdgeInsets.all(screenSize.height * 0.0131),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffCCCCCC)),
                  ),
                ),
                margin: EdgeInsets.only(top: screenSize.height * 0.032),
                child: Text('${index + 1}.',
                    style: TextStyle(fontSize: screenSize.width * 0.05))),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.028),
                child: TextField(
                  focusNode: _contentFocusNode,
                  controller: _voteDateItemController,
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: screenSize.width * 0.05),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(screenSize.width * 0.02),
                    hintText: '選擇日期',
                    hintStyle: TextStyle(
                        color: Color(0xffCCCCCC),
                        fontSize: screenSize.width * 0.05),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCCCCC)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCCCCC)),
                      //  when the TextFormField in focused
                    ),
                  ),
                  onTap: () {
                    _contentFocusNode.unfocus();
                    Pickers.showDatePicker(
                      context,
                      pickerStyle: customizeStyle(),
                      mode: DateMode.YMDHM,
                      suffix: Suffix(
                        years: '年',
                        month: '月',
                        days: '日',
                        hours: ' 時',
                        minutes: ' 分',
                      ),
                      selectDate: PDuration.now(),
                      onConfirm: (p) {
                        setState(() {
                          int count = 0;
                          String dateTime = formatDate(
                              DateTime(
                                  p.year, p.month, p.day, p.hour, p.minute),
                              [yyyy, '年', mm, '月', dd, '日 ', HH, ':', nn]);
                          _voteDateValues[index] = dateTime;
                          _voteDateFormat[index] = DateTime(
                            p.year,
                            p.month,
                            p.day,
                            p.hour,
                            p.minute,
                          ).toString();

                          _buttonIsOnpressed();

                          for (int i = 0; i < _voteDateValues.length; i++) {
                            if (_voteDateValues[i] == "") {
                              count++;
                            }
                          }
                          if (count == 0) {
                            setState(() {
                              _voteDateValues.add("");
                              _voteDateFormat.add("");
                            });
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  PickerStyle customizeStyle() {
    var screenSize = MediaQuery.of(context).size;

    Widget _cancelButton = Container(
        margin: EdgeInsets.only(left: screenSize.width * 0.03),
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: screenSize.width * 0.041,
            color: Color(0xffb4b4b4),
          ),
        ));
    Widget _commitButton = Container(
      margin: EdgeInsets.only(right: screenSize.width * 0.03),
      child: Text(
        '確認',
        style: TextStyle(
            fontSize: screenSize.width * 0.041,
            color: Theme.of(context).primaryColor),
      ),
    );
    return PickerStyle(
      cancelButton: _cancelButton,
      commitButton: _commitButton,
    );
  }

  Widget _buildCheckButtom(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _onPressed;

    if (_isEnabled == true) {
      _onPressed = () {
        setState(() {
          _voteItems = new List();
          _voteItemsName = new List();
          _voteDateItems = new List();
          _voteDateItemsName = new List();
          if (_tabController.index == 0) {
            for (int i = 0; i < _voteValues.length; i++) {
              if (_voteValues[i] != "") {
                _voteItemsName.add(_voteValues[i]);
              }
            }
            for (int i = 0; i < _voteItemsName.length; i++) {
              _voteItems.add(
                  {"voteItemNum": i + 1, "voteItemName": _voteItemsName[i]});
            }
            print(_voteTitleController.text);
            print(_voteItems);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VoteSettingPage(
                    groupNum, _voteTitleController.text, _voteItems)));
          }
          if (_tabController.index == 1) {
            for (int i = 0; i < _voteDateFormat.length; i++) {
              if (_voteDateFormat[i] != "") {
                _voteDateItemsName.add(_voteDateFormat[i]);
              }
            }
            for (int i = 0; i < _voteDateItemsName.length; i++) {
              _voteDateItems.add({
                "voteItemNum": i + 1,
                "voteItemName": _voteDateItemsName[i]
              });
            }
            print(_voteDateTitleController);
            print(_voteDateItems);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VoteSettingPage(
                    groupNum, _voteDateTitleController.text, _voteDateItems)));
          }
        });
      };
    }
    return Row(children: <Widget>[
      Expanded(
        // ignore: deprecated_member_use
        child: FlatButton(
          height: screenSize.height * 0.07,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Image.asset(
            'assets/images/cancel.png',
            width: screenSize.width * 0.05,
          ),
          color: Theme.of(context).primaryColorLight,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Expanded(
          // ignore: deprecated_member_use
          child: Builder(builder: (context) {
        return FlatButton(
            disabledColor: Color(0xffCCCCCC),
            height: screenSize.height * 0.07,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Image.asset(
              'assets/images/confirm.png',
              width: screenSize.width * 0.05,
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: _onPressed);
      }))
    ]);
  }
}
