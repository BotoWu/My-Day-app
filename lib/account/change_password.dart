import 'package:My_Day_app/account/login.dart';
import 'package:My_Day_app/account/login_fail.dart';
import 'package:My_Day_app/public/account_request/change_pw.dart';
import 'package:flutter/material.dart';

import 'package:My_Day_app/public/loadUid.dart';

class ChangepwPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }

  @override
  ChangepwWidget createState() => new ChangepwWidget();
}

class ChangepwWidget extends State<ChangepwPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;
    double _appBarSize = _width * 0.052;
    double _leadingL = _height * 0.02;

    Color _color = Color(0xffF86D67);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('更改密碼',
            style: TextStyle(color: Colors.white, fontSize: _appBarSize)),
        backgroundColor: _color,
        leading: Container(
          margin: EdgeInsets.only(left: _leadingL),
          child: GestureDetector(
            child: Icon(Icons.chevron_left),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: _Changepw(),
    ));
  }
}

class _Changepw extends StatelessWidget {
  get direction => null;
  get border => null;
  get decoration => null;
  get child => null;
  get btnCenterClickEvent => null;
  get appBar => null;
  String _alertTitle = '更改失敗';
  String _alertTxt = '請確認密碼是否相同';

  final newpw = TextEditingController();
  final confirmpw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width;
    double _height = size.height;

    double _listLR = _height * 0.05;
    double _listB = _height * 0.01;
    double _borderRadius = _height * 0.01;
    double _iconWidth = _width * 0.05;
    double _bottomHeight = _height * 0.07;
    double _titleSize = _height * 0.025;

    Color _color = Theme.of(context).primaryColor;
    Color _light = Theme.of(context).primaryColorLight;
    Color _bule = Color(0xff7AAAD8);
    String id = 'lili123';

    _submit() async {
      String uid = id;
      String password = newpw.text;

      var submitWidget;
      _submitWidgetfunc() async {
        return ChangePw(uid: uid, password: password);
      }

      submitWidget = await _submitWidgetfunc();
      if (await submitWidget.getIsError())
        return true;
      else
        return false;
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: GestureDetector(
                    // 點擊空白處釋放焦點
                    behavior: HitTestBehavior.translucent,
                    onTap: () =>
                        FocusScope.of(context).requestFocus(FocusNode()),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: _listLR,
                            bottom: _listB,
                            top: _height * 0.05,
                            right: _listLR,
                          ),
                          child: ListTile(
                            title: Text('新密碼：',
                                style: TextStyle(fontSize: _titleSize)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: _height * 0.07,
                            bottom: _listB,
                            top: _height * 0.0001,
                            right: _height * 0.07,
                          ),
                          child: TextField(
                            controller: newpw,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: _height * 0.015,
                                  vertical: _height * 0.015),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    _borderRadius)), //设置边框四个角的弧度
                                borderSide: BorderSide(color: _bule),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: _listLR,
                            bottom: _listB,
                            top: _height * 0.01,
                            right: _listLR,
                          ),
                          child: ListTile(
                            title: Text('再次輸入密碼：',
                                style: TextStyle(fontSize: _titleSize)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: _height * 0.07,
                            bottom: _listB,
                            top: _height * 0.0005,
                            right: _height * 0.07,
                          ),
                          child: TextField(
                            controller: confirmpw,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Color(0xfff3f3f4),
                              filled: true,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: _height * 0.015,
                                  vertical: _height * 0.015),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    _borderRadius)), //设置边框四个角的弧度
                                borderSide: BorderSide(color: _bule),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                bottomNavigationBar: Container(
                    child: Row(children: <Widget>[
                  Expanded(
                    child: SizedBox(
                        height: _bottomHeight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              backgroundColor: _light),
                          child: Image.asset(
                            'assets/images/cancel.png',
                            width: _iconWidth,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: _bottomHeight,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: _color,
                        ),
                        child: Image.asset(
                          'assets/images/confirm.png',
                          width: _iconWidth,
                        ),
                        onPressed: () async {
                          if (newpw.text.isNotEmpty &&
                              confirmpw.text.isNotEmpty) {
                            if (newpw.text == confirmpw.text) {
                              if (await _submit() != true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              } else {
                                await changefailDialog(
                                    context, _alertTitle, _alertTxt);
                              }
                            } else {
                              await changefailDialog(
                                  context, _alertTitle, _alertTxt);
                            }
                          } else {
                            await changefailDialog(
                                context, _alertTitle, _alertTxt);
                          }
                        }),
                  )),
                ])))));
  }
}
