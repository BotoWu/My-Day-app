// dart
import 'dart:convert';
// flutter
import 'package:flutter/material.dart';
// therd
import 'package:http/http.dart' as http;
// my day
import 'package:My_Day_app/public/alert.dart';
import 'package:My_Day_app/public/toast.dart';
//  schedule
import 'package:My_Day_app/models/schedule/schedule_model.dart';
import 'package:My_Day_app/models/schedule/schedule_list_model.dart';
import 'package:My_Day_app/models/schedule/group_studyplan_list_model.dart';
import 'package:My_Day_app/models/schedule/countdown_list_model.dart';
//  friend
import 'package:My_Day_app/models/friend/best_friend_list_model.dart';
import 'package:My_Day_app/models/friend/friend_list_model.dart';
import 'package:My_Day_app/models/friend/make_friend_invite_list_model.dart';
//  group
import 'package:My_Day_app/models/group/common_schedule_list_model.dart';
import 'package:My_Day_app/models/group/get_common_schedule_model.dart';
import 'package:My_Day_app/models/group/get_group_model.dart';
import 'package:My_Day_app/models/group/group_invite_friend_list_model.dart';
import 'package:My_Day_app/models/group/group_invite_list_model.dart';
import 'package:My_Day_app/models/group/group_list_model.dart';
import 'package:My_Day_app/models/group/group_log_model.dart';
import 'package:My_Day_app/models/group/group_member_list_model.dart';
//  studyplan
import 'package:My_Day_app/models/studyplan/studyplan_list_model.dart';
import 'package:My_Day_app/models/studyplan/studyplan_model.dart';
import 'package:My_Day_app/models/studyplan/common_studyplan_list_model.dart';
import 'package:My_Day_app/models/studyplan/personal_share_studyplan_model.dart';
//  temporary_group
import 'package:My_Day_app/models/temporary_group/get_temporary_group_invitet_model.dart';
import 'package:My_Day_app/models/temporary_group/temporary_group_list_model.dart';
//  timetable
import 'package:My_Day_app/models/timetable/main_timetable_list_model.dart';
import 'package:My_Day_app/models/timetable/sharecode_model.dart';
import 'package:My_Day_app/models/timetable/timetable_list_model.dart';
import 'package:My_Day_app/models/timetable/section_time_model.dart';
//  vote
import 'package:My_Day_app/models/vote/get_vote_model.dart';
import 'package:My_Day_app/models/vote/vote_end_list_model.dart';
import 'package:My_Day_app/models/vote/vote_list_model.dart';
//  note
import 'package:My_Day_app/models/note/share_note_list_model.dart';
import 'package:My_Day_app/models/note/note_list_model.dart';
import 'package:My_Day_app/models/note/get_note_model.dart';
//  setting
import 'package:My_Day_app/models/setting/get_friend_privacy.dart';
import 'package:My_Day_app/models/setting/get_location.dart';
import 'package:My_Day_app/models/setting/get_notice.dart';
import 'package:My_Day_app/models/setting/get_temporary_notice.dart';
import 'package:My_Day_app/models/setting/get_timetable.dart';
import 'package:My_Day_app/models/setting/themes_model.dart';
//  profile
import 'package:My_Day_app/models/profile/profile_list.dart';

class Request {
  static const host = 'http://myday.sytes.net';
  static const Map path = {
    'account': '/account',
    'friend': '/friend',
    'group': '/group',
    'note': '/note',
    'schedule': '/schedule',
    'setting': '/setting',
    'studyplan': '/studyplan',
    'temporaryGroup': '/temporary_group',
    'timetable': '/timetable',
    'profile': '/profile',
    'vote': '/vote'
  };
  static Map scheduleUrl = {
    'create_new': '$host${path['schedule']}/create_new/',
    'edit': '$host${path['schedule']}/edit/',
    'delete': '$host${path['schedule']}/delete/',
    'get': '${path['schedule']}/get/',
    'get_list': '${path['schedule']}/get_list/',
    'create_common': '$host${path['schedule']}/create_common/',
    'get_common': '${path['schedule']}/get_common/',
    'common_list': '${path['schedule']}/common_list/',
    'common_hidden': '$host${path['schedule']}/common_hidden/',
    'countdown_list': '${path['schedule']}/countdown_list/',
  };
  static Map groupUrl = {
    'create_group': '$host${path['group']}/create_group/',
    'edit_group': '$host${path['group']}/edit_group/',
    'invite_friend': '$host${path['group']}/invite_friend/',
    'setting_manager': '$host${path['group']}/setting_manager/',
    'quit_group': '$host${path['group']}/quit_group/',
    'member_status': '$host${path['group']}/member_status/',
    'group_list': '${path['group']}/group_list/',
    'get_log': '${path['group']}/get_log/',
    'invite_list': '${path['group']}/invite_list/',
    'member_list': '${path['group']}/member_list/',
    'invite_friend_list': '${path['group']}/invite_friend_list/',
    'get': '${path['group']}/get/',
  };
  static Map temporaryGroupUrl = {
    'create_group': '$host${path['temporaryGroup']}/create_group/',
    'invite_list': '${path['temporaryGroup']}/invite_list/',
    'temporary_list': '${path['temporaryGroup']}/temporary_list/',
    'get_invite': '${path['temporaryGroup']}/get_invite/',
  };
  static Map accountUrl = {
    'login': '$host${path['account']}/login/',
    'register': '$host${path['account']}/register/',
    'change_pw': '$host${path['account']}/change_pw/',
    'forget_pw': '$host${path['account']}/forget_pw/',
    'send_code': '$host${path['account']}/send_code/',
  };
  static Map settingUrl = {
    'friend_privacy': '$host${path['setting']}/friend_privacy/',
    'notice': '$host${path['setting']}/notice/',
    'notice_timetable': '$host${path['setting']}/notice_timetable/',
    'privacy_location': '$host${path['setting']}/privacy_location/',
    'privacy_timetable': '$host${path['setting']}/privacy_timetable/',
    'themes': '$host${path['setting']}/themes/',
    'get_themes': '${path['setting']}/get_themes/',
    'get_location': '${path['setting']}/get_location/',
    'get_timetable': '${path['setting']}/get_timetable/',
    'get_notice': '${path['setting']}/get_notice/',
    'get_friend_privacy': '${path['setting']}/get_friend_privacy/',
  };
  static Map friendUrl = {
    'get': '${path['friend']}/get/',
    'friend_list': '${path['friend']}/friend_list/',
    'make_invite_list': '${path['friend']}/make_invite_list/',
    'best_list': '${path['friend']}/best_list/',
    'add_best': '$host${path['friend']}/add_best/',
    'add': '$host${path['friend']}/add/',
    'add_reply': '$host${path['friend']}/add_reply/',
    'delete': '$host${path['friend']}/delete/',
    'delete_best': '$host${path['friend']}/delete_best/'
  };
  static Map timetableUrl = {
    'create_timetable': '$host${path['timetable']}/create_timetable',
    'main_timetable_list': '${path['timetable']}/main_timetable_list/',
    'get_timetable_list': '${path['timetable']}/get_timetable_list/',
    'get_timetable': '${path['timetable']}/get_timetable/',
    'get_section_time': '${path['timetable']}/get_section_time/',
    'get_sharecode': '${path['timetable']}/get_sharecode/',
    'get_section_time': '${path['timetable']}/get_section_time'
  };
  static Map voteUrl = {
    'create_new': '$host${path['vote']}/create_new/',
    'edit': '$host${path['vote']}/edit/',
    'delete': '$host${path['vote']}/delete/',
    'get': '${path['vote']}/get/',
    'get_list': '${path['vote']}/get_list/',
    'vote': '$host${path['vote']}/vote/',
    'add_items': '$host${path['vote']}/add_items/',
    'get_end_list': '${path['vote']}/get_end_list/',
  };
  static Map studyplanUrl = {
    'create_studyplan': '$host${path['studyplan']}/create_studyplan/',
    'edit_studyplan': '$host${path['studyplan']}/edit_studyplan/',
    'sharing': '$host${path['studyplan']}/sharing/',
    'delete': '$host${path['studyplan']}/delete/',
    'cancel_sharing': '$host${path['studyplan']}/cancel_sharing/',
    'get': '${path['studyplan']}/get/',
    'personal_list': '${path['studyplan']}/personal_list/',
    'personal_share_list': '${path['studyplan']}/personal_share_list/',
    'group_list': '${path['studyplan']}/group_list/',
    'one_group_list': '${path['studyplan']}/one_group_list/',
  };
  static Map noteUrl = {
    'create_new': '$host${path['note']}/create_new/',
    'edit': '$host${path['note']}/edit/',
    'delete': '$host${path['note']}/delete/',
    'get': '${path['note']}/get/',
    'get_list': '${path['note']}/get_list/',
    'get_group_list': '${path['note']}/get_group_list/',
    'share': '$host${path['note']}/share/',
    'cancel_share': '$host${path['note']}/cancel_share/',
    'not_share_list': '${path['note']}/not_share_list/',
  };
  static Map profileUrl = {
    'profile_list': '${path['profile']}/profile_list/',
    'edit_profile': '$host${path['profile']}/edit_profile/',
  };

  Map headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Map<String, dynamic> _responseBody;

  ScheduleGet _scheduleGet;
  ScheduleGetList _scheduleGetList;
  GetCommonScheduleModel _commenSchedule;
  CommonScheduleListModel _commonScheduleList;
  CountdownList _countdownList;

  GroupListModel _groupList;
  GroupInviteListModel _groupInviteList;
  GroupLogModel _groupLog;
  GetGroupModel _group;
  GroupInviteFriendListModel _groupInviteFriendList;
  GroupMemberListModel _groupMemberList;

  TemporaryGroupListModel _temporaryGroupList;
  TemporaryGroupListModel _temporaryGroupInviteList;
  GetTemporaryGroupInviteModel _temporaryGroupInvite;

  FriendListModel _friendList;
  BestFriendListModel _bestFriendList;
  MakeFriendInviteListModel _makefriendinviteList;

  MainTimetableListGet _mainTimetableListGet;
  TimetableListModel _timetableList;
  SharecodeModel _sharecodeModel;
  SectionTime _sectionTime;

  VoteListModel _voteList;
  VoteEndListModel _voteEndList;
  GetVoteModel _vote;

  StudyplanModel _studyplan;
  ShareStudyplanListModel _shareStudyplanList;
  PersonalShareStudyplanListModel _personalShareStudyplanList;
  StudyplanListModel _studyplanList;
  GroupStudyplanListModel _groupStudyplanList;

  ShareNoteListModel _shareNoteList;
  NoteListModel _noteList;
  NoteListModel _notShareNoteList;
  GetNoteModel _getnote;

  GetThemesModel _getThemes;
  GetLocationModel _getLocation;
  GetTimetableModel _getTimetable;
  GetNoticeModel _getNotice;
  GetTimetableNoticeModel _getTimetableNotice;
  GetFriendPrivacyModel _getFriendPrivacy;

  GetProfileListModel _getProfileList;

  bool _isError;

  getScheduleGet() => _scheduleGet;
  getScheduleGetList() => _scheduleGetList;
  getCommenScheduleGet() => _commenSchedule;
  getCommonScheduleListGet() => _commonScheduleList;
  getCountdownList() => _countdownList;

  getGroupListGet() => _groupList;
  getGroupInviteListGet() => _groupInviteList;
  getGroupLogGet() => _groupLog;
  getGroupGet() => _group;
  getGroupInviteFriendListGet() => _groupInviteFriendList;
  getGroupMemberListGet() => _groupMemberList;

  getTemporaryGroupListGet() => _temporaryGroupList;
  getTemporaryGroupInviteListGet() => _temporaryGroupInviteList;
  getTemporaryGroupInviteGet() => _temporaryGroupInvite;

  getFriendListGet() => _friendList;
  getBestFriendGet() => _bestFriendList;
  getMakeFriendInviteListGet() => _makefriendinviteList;

  getMainTimetableListGet() => _mainTimetableListGet;
  getTimetableList() => _timetableList;
  getSharecode() => _sharecodeModel;
  getSectionTime() => _sectionTime;

  getVoteList() => _voteList;
  getVoteEndList() => _voteEndList;
  getVote() => _vote;

  getStudyplan() => _studyplan;
  getShareStudyplanList() => _shareStudyplanList;
  getPersonalShareStudyplanList() => _personalShareStudyplanList;
  getStudyplanList() => _studyplanList;
  getGroupStudyplanList() => _groupStudyplanList;

  getShareNoteList() => _shareNoteList;
  getNoteList() => _noteList;
  getNote() => _getnote;
  getNotShareNoteList() => _notShareNoteList;

  getThemesGet() => _getThemes;
  getLocationGet() => _getLocation;
  getTimetableGet() => _getTimetable;
  getNoticeGet() => _getNotice;
  getTimetableNoticeGet() => _getTimetableNotice;
  getFriendPrivacyGet() => _getFriendPrivacy;

  getProfileListGet() => _getProfileList;

  getIsError() => _isError;

  printRequest(String type, String str, var data) {
    print(
        '$type:  $str\n-------------------------------------------------------------------------');
    print(data);
    print(
        '-------------------------------------------------------------------------');
  }

  httpFunction(BuildContext context, dynamic response, String toastTxt) async {
    Map responseBody;

    try {
      responseBody = json.decode(utf8.decode(response.bodyBytes));
    } catch (error) {
      _isError = true;
      print(
          'http error \n-------------------------------------------------------------------------');
      print('error: ${utf8.decode(response.bodyBytes)}');
      print(
          '-------------------------------------------------------------------------');
      await alert(context, '無法連線', '請檢查連線狀態或聯絡客服確認伺服器狀態');
    }

    if (responseBody != null) {
      if ((response.statusCode / 100).toInt() == 2) {
        _isError = false;
        if (responseBody['response'] == true) {
          if (toastTxt != null)
            toast(context, toastTxt);
          else
            _responseBody = json.decode(utf8.decode(response.bodyBytes));
        }
      } else {
        _isError = true;
        if (responseBody['response'] == false) {
          await alert(context, '錯誤', responseBody['message']);
          _responseBody = null;
        } else {
          await alert(context, '未知錯誤', '請聯絡客服(${response.statusCode})');
        }
      }
    }

    print(
        'http respons \n-------------------------------------------------------------------------');
    print('statusCode: ${response.statusCode}');
    print('body: ${utf8.decode(response.bodyBytes)}');
    print(
        '-------------------------------------------------------------------------');
  }

  httpGet(BuildContext context, Map<String, String> data, String _url,
      String requestName) async {
    printRequest('Get', requestName, data);
    Uri _uri = Uri.http('myday.sytes.net', _url, data);
    dynamic response = await http.get(_uri, headers: headers);
    await httpFunction(context, response, null);
  }

  httpPost(BuildContext context, Map<String, dynamic> data, String _url,
      String toastTxt, String requestName) async {
    printRequest('Post', requestName, data);
    Uri _uri = Uri.parse(_url);
    dynamic response =
        await http.post(_uri, headers: headers, body: json.encode(data));
    await httpFunction(context, response, toastTxt);
  }

  httpPut(BuildContext context, Map<String, dynamic> data, String _url,
      String toastTxt, String requestName) async {
    printRequest('Put', requestName, data);
    Uri _uri = Uri.parse(_url);
    dynamic response =
        await http.put(_uri, headers: headers, body: json.encode(data));
    await httpFunction(context, response, toastTxt);
  }

  httpPatch(BuildContext context, Map<String, dynamic> data, String _url,
      String toastTxt, String requestName) async {
    printRequest('Patch', requestName, data);
    Uri _uri = Uri.parse(_url);
    dynamic response =
        await http.patch(_uri, headers: headers, body: json.encode(data));
    await httpFunction(context, response, toastTxt);
  }

  httpDelete(BuildContext context, Map<String, dynamic> data, String _url,
      String toastTxt, String requestName) async {
    printRequest('Delete', requestName, data);
    Uri _uri = Uri.parse(_url);
    dynamic response =
        await http.delete(_uri, headers: headers, body: json.encode(data));
    await httpFunction(context, response, toastTxt);
  }

// SCHEDULE ============================================================================================
// create_new -------------------------------------------------------------------------------------
  scheduleCreateNew(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['create_new'];
    await httpPost(context, data, _url, '新增成功', 'scheduleCreateNew');
  }

// edit -------------------------------------------------------------------------------------------
  scheduleEdit(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['edit'];
    await httpPost(context, data, _url, '編輯成功', 'scheduleEdit');
  }

// delete -----------------------------------------------------------------------------------------
  scheduleDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['delete'];
    await httpPost(context, data, _url, '刪除成功', 'scheduleDelete');
  }

// create_common ----------------------------------------------------------------------------------
  scheduleCreateCommon(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['create_common'];
    await httpPost(context, data, _url, '新增成功', 'scheduleCreateCommon');
  }

// get --------------------------------------------------------------------------------------------
  scheduleGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['get'];
    await httpGet(context, data, _url, 'scheduleGet');
    if (_responseBody != null) {
      _scheduleGet = ScheduleGet.fromJson(_responseBody);
    }
  }

// get_list ---------------------------------------------------------------------------------------
  scheduleGetList(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['get_list'];
    await httpGet(context, data, _url, 'scheduleGetList');
    if (_responseBody != null) {
      _scheduleGetList = ScheduleGetList.fromJson(_responseBody);
    }
  }

// get_common -------------------------------------------------------------------------------------
  scheduleGetCommon(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['get_common'];
    await httpGet(context, data, _url, 'scheduleGetCommon');
    if (_responseBody != null) {
      _commenSchedule = GetCommonScheduleModel.fromJson(_responseBody);
    }
  }

// common_list ------------------------------------------------------------------------------------
  scheduleCommonList(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['common_list'];
    await httpGet(context, data, _url, 'scheduleCommonList');
    if (_responseBody != null) {
      _commonScheduleList = CommonScheduleListModel.fromJson(_responseBody);
    }
  }

// countdown_list ---------------------------------------------------------------------------------
  countdownList(BuildContext context, Map<String, dynamic> data) async {
    String _url = scheduleUrl['countdown_list'];
    await httpGet(context, data, _url, 'countdownList');
    if (_responseBody != null) {
      _countdownList = CountdownList.fromJson(_responseBody);
    }
  }

// GROUP ===============================================================================================
// goup_list --------------------------------------------------------------------------------------
  groupList(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['group_list'];
    await httpGet(context, data, _url, 'groupList');
    if (_responseBody != null) {
      _groupList = GroupListModel.fromJson(_responseBody);
    }
  }

  // goup_invite_list -----------------------------------------------------------------------------
  groupInviteList(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['invite_list'];
    await httpGet(context, data, _url, 'groupInviteList');
    if (_responseBody != null) {
      _groupInviteList = GroupInviteListModel.fromJson(_responseBody);
    }
  }

  // group_create ---------------------------------------------------------------------------------
  groupCreate(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['create_group'];
    await httpPost(context, data, _url, '新增成功', 'groupCreate');
  }

  // group_invite_friend --------------------------------------------------------------------------
  groupInviteFriend(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['invite_friend'];
    await httpPost(context, data, _url, '邀請成功', 'groupInviteFriend');
  }

  // group_member_status --------------------------------------------------------------------------
  groupMemberStatus(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['member_status'];
    String toastText;
    if (data['statusId'] == 1)
      toastText = '加入成功';
    else if (data['statusId'] == 3) toastText = '拒絕成功';
    await httpPatch(context, data, _url, toastText, 'groupMemberStatus');
  }

  // group_get_log --------------------------------------------------------------------------------
  groupGetLog(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['get_log'];
    await httpGet(context, data, _url, 'groupGetLog');
    if (_responseBody != null) {
      _groupLog = GroupLogModel.fromJson(_responseBody);
    }
  }

  // group_invite_friend_list ---------------------------------------------------------------------
  groupInviteFriendList(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['invite_friend_list'];
    await httpGet(context, data, _url, 'groupInviteFriendList');
    if (_responseBody != null) {
      _groupInviteFriendList =
          GroupInviteFriendListModel.fromJson(_responseBody);
    }
  }

  // group_get ------------------------------------------------------------------------------------
  groupGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['get'];
    await httpGet(context, data, _url, 'groupGet');
    if (_responseBody != null) {
      _group = GetGroupModel.fromJson(_responseBody);
    }
  }

  // group_member_list ----------------------------------------------------------------------------
  groupMemberList(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['member_list'];
    await httpGet(context, data, _url, 'groupMemberList');
    if (_responseBody != null) {
      _groupMemberList = GroupMemberListModel.fromJson(_responseBody);
    }
  }

  // group_setting_manager ------------------------------------------------------------------------
  groupSettingManager(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['setting_manager'];
    String toastText;
    if (data['statusId'] == 1)
      toastText = '刪除成功';
    else if (data['statusId'] == 4) toastText = '加入成功';
    await httpPatch(context, data, _url, toastText, 'groupSettingManager');
  }

  // group_edit -----------------------------------------------------------------------------------
  groupEdit(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['edit_group'];
    await httpPatch(context, data, _url, '編輯成功', 'groupEdit');
  }

  // group_quit -----------------------------------------------------------------------------------
  groupQuit(BuildContext context, Map<String, dynamic> data) async {
    String _url = groupUrl['quit_group'];
    await httpDelete(context, data, _url, '已退出', 'groupQuit');
  }

  // TEMPORARYGROUP ====================================================================================
  // temporary_create_group -----------------------------------------------------------------------
  temporaryCreateGroup(BuildContext context, Map<String, dynamic> data) async {
    String _url = temporaryGroupUrl['create_group'];
    await httpPost(context, data, _url, '新增成功', 'temporaryCreateGroup');
  }

  // temporary_list -------------------------------------------------------------------------------
  temporaryList(BuildContext context, Map<String, dynamic> data) async {
    String _url = temporaryGroupUrl['temporary_list'];
    await httpGet(context, data, _url, 'temporaryList');
    if (_responseBody != null) {
      _temporaryGroupList = TemporaryGroupListModel.fromJson(_responseBody);
    }
  }

  // temporary_invite_list ------------------------------------------------------------------------
  temporaryInviteList(BuildContext context, Map<String, dynamic> data) async {
    String _url = temporaryGroupUrl['invite_list'];
    await httpGet(context, data, _url, 'temporaryInviteList');
    if (_responseBody != null) {
      _temporaryGroupInviteList =
          TemporaryGroupListModel.fromJson(_responseBody);
    }
  }

  // temporary_get_invite -------------------------------------------------------------------------
  temporaryGetInvite(BuildContext context, Map<String, dynamic> data) async {
    String _url = temporaryGroupUrl['get_invite'];
    await httpGet(context, data, _url, 'temporaryGetInvite');
    if (_responseBody != null) {
      _temporaryGroupInvite =
          GetTemporaryGroupInviteModel.fromJson(_responseBody);
    }
  }

  // FRIEND ============================================================================================
  // friend_list ----------------------------------------------------------------------------------
  friendList(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['friend_list'];
    await httpGet(context, data, _url, 'friendList');
    if (_responseBody != null) {
      _friendList = FriendListModel.fromJson(_responseBody);
    }
  }

  // best_friend_list -----------------------------------------------------------------------------
  bestFriendList(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['best_list'];
    await httpGet(context, data, _url, 'bestFriendList');
    if (_responseBody != null) {
      _bestFriendList = BestFriendListModel.fromJson(_responseBody);
    }
  }

  // make-friend-invite-list ----------------------------------------------------------------------
  makeFriendInviteList(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['make_invite_list'];
    await httpGet(context, data, _url, 'makefriendinviteList');
    if (_responseBody != null) {
      _makefriendinviteList = MakeFriendInviteListModel.fromJson(_responseBody);
    }
  }

  // add_friend -----------------------------------------------------------------------------------
  addFriend(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['add'];
    await httpPost(context, data, _url, '已發出交友邀請', 'addFriend');
  }

  // add_bestfriend -------------------------------------------------------------------------------
  addBestFriend(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['add_best'];
    await httpPatch(context, data, _url, '新增成功', 'addBestFriend');
  }

  // add_reply ------------------------------------------------------------------------------------
  addReply(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['add_reply'];
    await httpPatch(context, data, _url, '新增成功', 'addReply');
  }

  // friend_delete --------------------------------------------------------------------------------
  friendDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['delete'];
    await httpDelete(context, data, _url, '刪除成功', 'friendDelete');
  }

  // bestfriend_delete ----------------------------------------------------------------------------
  bestFriendDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = friendUrl['delete_best'];
    await httpPatch(context, data, _url, '刪除成功', 'bestFriendDelete');
  }

  // TIMETABLE =========================================================================================
  // create_timetable -----------------------------------------------------------------------------
  createTimetable(BuildContext context, Map<String, dynamic> data) async {
    String _url = timetableUrl['create_timetable'];
    await httpPost(context, data, _url, '新增成功', 'createTimetable');
  }

  // mainTimetableGet -----------------------------------------------------------------------------
  mainTimetableListGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = timetableUrl['main_timetable_list'];
    await httpGet(context, data, _url, 'mainTimetableListGet');
    if (_responseBody != null) {
      _mainTimetableListGet = MainTimetableListGet.fromJson(_responseBody);
    }
  }

  // timetableList --------------------------------------------------------------------------------
  timetableList(BuildContext context, Map<String, dynamic> data) async {
    String _url = timetableUrl['get_timetable_list'];
    await httpGet(context, data, _url, 'timetableList');
    if (_responseBody != null) {
      _timetableList = TimetableListModel.fromJson(_responseBody);
    }
  }

  // sharecode ------------------------------------------------------------------------------------
  sharecode(BuildContext context, Map<String, dynamic> data) async {
    String _url = timetableUrl['get_sharecode'];
    await httpGet(context, data, _url, 'sharecode');
    if (_responseBody != null) {
      _sharecodeModel = SharecodeModel.fromJson(_responseBody);
    }
  }

  // sectionTime ----------------------------------------------------------------------------------
  sectionTime(BuildContext context, Map<String, dynamic> data) async {
    String _url = timetableUrl['get_section_time'];
    await httpGet(context, data, _url, 'sectionTime');
    if (_responseBody != null) {
      _sectionTime = SectionTime.fromJson(_responseBody);
    }
  }

  // VOTE ==============================================================================================
  // vote_list ------------------------------------------------------------------------------------
  voteList(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['get_list'];
    await httpGet(context, data, _url, 'voteList');
    if (_responseBody != null) {
      _voteList = VoteListModel.fromJson(_responseBody);
    }
  }

  // vote_end_list --------------------------------------------------------------------------------
  voteEndList(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['get_end_list'];
    await httpGet(context, data, _url, 'voteEndList');
    if (_responseBody != null) {
      _voteEndList = VoteEndListModel.fromJson(_responseBody);
    }
  }

  // vote_create_new ------------------------------------------------------------------------------
  voteCreateNew(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['create_new'];
    await httpPost(context, data, _url, '新增成功', 'voteCreateNew');
  }

  // vote_get -------------------------------------------------------------------------------------
  voteGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['get'];
    await httpGet(context, data, _url, 'voteGet');
    if (_responseBody != null) {
      _vote = GetVoteModel.fromJson(_responseBody);
    }
  }

  // vote_add_items -------------------------------------------------------------------------------
  voteAddItems(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['add_items'];
    await httpPost(context, data, _url, '新增成功', 'voteAddItems');
  }

  // vote -----------------------------------------------------------------------------------------
  vote(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['vote'];
    await httpPost(context, data, _url, '投票成功', 'vote');
  }

  // vote_edit ------------------------------------------------------------------------------------
  voteEdit(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['edit'];
    await httpPost(context, data, _url, '編輯成功', 'voteEdit');
  }

  // vote_delete ----------------------------------------------------------------------------------
  voteDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = voteUrl['delete'];
    await httpPost(context, data, _url, '刪除成功', 'voteDelete');
  }

  // STUDYPLAN =========================================================================================
  // get ------------------------------------------------------------------------------------------
  studyplanGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['get'];
    await httpGet(context, data, _url, 'studyplanGet');
    if (_responseBody != null) {
      _studyplan = StudyplanModel.fromJson(_responseBody);
    }
  }

  // one_group_list -------------------------------------------------------------------------------
  studyplanOneGroupList(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['one_group_list'];
    await httpGet(context, data, _url, 'studyplanOneGroupList');
    if (_responseBody != null) {
      _shareStudyplanList = ShareStudyplanListModel.fromJson(_responseBody);
    }
  }

  // personal_share_list --------------------------------------------------------------------------
  studyplanPersonalShareList(
      BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['personal_share_list'];
    await httpGet(context, data, _url, 'studyplanPersonalShareList');
    if (_responseBody != null) {
      _personalShareStudyplanList =
          PersonalShareStudyplanListModel.fromJson(_responseBody);
    }
  }

  // personal_list --------------------------------------------------------------------------------
  studyplanPersonalList(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['personal_list'];
    await httpGet(context, data, _url, 'studyplanPersonalList');
    if (_responseBody != null) {
      _studyplanList = StudyplanListModel.fromJson(_responseBody);
    }
  }

  // group_list -----------------------------------------------------------------------------------
  studyplanGroupList(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['group_list'];
    await httpGet(context, data, _url, 'studyplanPersonalList');
    if (_responseBody != null) {
      _groupStudyplanList = GroupStudyplanListModel.fromJson(_responseBody);
    }
  }

  // delete ---------------------------------------------------------------------------------------
  studyplanDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['delete'];
    await httpDelete(context, data, _url, '刪除成功', 'studyplanDelete');
  }

  // sharing --------------------------------------------------------------------------------------
  studyplanSharing(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['sharing'];
    await httpPatch(context, data, _url, '分享成功', 'studyplanSharing');
  }

  // cancel_sharing -------------------------------------------------------------------------------
  studyplanCancelSharing(
      BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['cancel_sharing'];
    await httpPatch(context, data, _url, '已取消', 'studyplanCancelSharing');
  }

  // create_studyplan -----------------------------------------------------------------------------
  studyplanCreate(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['create_studyplan'];
    await httpPost(context, data, _url, '新增成功', 'studyplanCreate');
  }

  // edit_studyplan -------------------------------------------------------------------------------
  studyplanEdit(BuildContext context, Map<String, dynamic> data) async {
    String _url = studyplanUrl['edit_studyplan'];
    await httpPut(context, data, _url, '編輯成功', 'studyplanEdit');
  }

  // NOTE ==============================================================================================
  // get_group_list -------------------------------------------------------------------------------
  noteGetGroupList(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['get_group_list'];
    await httpGet(context, data, _url, 'noteGetGroupList');
    if (_responseBody != null) {
      _shareNoteList = ShareNoteListModel.fromJson(_responseBody);
    }
  }

  // get_list -------------------------------------------------------------------------------------
  noteGetList(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['get_list'];
    await httpGet(context, data, _url, 'noteGetList');
    if (_responseBody != null) {
      _noteList = NoteListModel.fromJson(_responseBody);
    }
  }

  // not_share_list -------------------------------------------------------------------------------------
  notShareNoteList(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['not_share_list'];
    await httpGet(context, data, _url, 'notShareNoteList');
    if (_responseBody != null) {
      _notShareNoteList = NoteListModel.fromJson(_responseBody);
    }
  }

  // get -------------------------------------------------------------------------------------
  noteGet(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['get'];
    await httpGet(context, data, _url, 'noteGet');
    if (_responseBody != null) {
      _getnote = GetNoteModel.fromJson(_responseBody);
    }
  }

  // share ----------------------------------------------------------------------------------------
  noteShare(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['share'];
    await httpPost(context, data, _url, '分享成功', 'noteShare');
  }

  // cancel_share ---------------------------------------------------------------------------------
  noteCancelShare(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['cancel_share'];
    await httpPost(context, data, _url, '已取消', 'noteCancelShare');
  }

  // create_new -----------------------------------------------------------------------------------
  createNew(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['create_new'];
    await httpPost(context, data, _url, '新增成功', 'createNew');
  }

  // edit -----------------------------------------------------------------------------------------
  noteEdit(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['edit'];
    await httpPost(context, data, _url, '編輯成功', 'noteEdit');
  }

  // delete ---------------------------------------------------------------------------------------
  noteDelete(BuildContext context, Map<String, dynamic> data) async {
    String _url = noteUrl['delete'];
    await httpPost(context, data, _url, '刪除成功', 'noteDelete');
  }

  // ACCOUNT ===========================================================================================
  // login ----------------------------------------------------------------------------------------
  login(BuildContext context, Map<String, String> data) async {
    String _url = accountUrl['login'];
    await httpPost(context, data, _url, '登入成功', 'login');
  }

  // register -------------------------------------------------------------------------------------
  register(BuildContext context, Map<String, dynamic> data) async {
    String _url = accountUrl['register'];
    await httpPost(context, data, _url, '註冊成功', 'register');
  }

  // change_pw ------------------------------------------------------------------------------------
  changePw(BuildContext context, Map<String, dynamic> data) async {
    String _url = accountUrl['change_pw'];
    await httpPost(context, data, _url, '更改成功', 'changePw');
  }

  // forget_pw ------------------------------------------------------------------------------------
  forgetPw(BuildContext context, Map<String, dynamic> data) async {
    String _url = accountUrl['forget_pw'];
    await httpPost(context, data, _url, '驗證成功', 'forgetPw');
  }

  // send_code ------------------------------------------------------------------------------------
  sendCode(BuildContext context, Map<String, dynamic> data) async {
    String _url = accountUrl['send_code'];
    await httpPost(context, data, _url, '發送成功', 'sendCode');
  }

  // SETTING ===========================================================================================
  // friend_privacy -------------------------------------------------------------------------------
  friendPrivacy(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['friend_privacy'];
    await httpPost(context, data, _url, '好友隱私設定成功', 'friendPrivacy');
  }

  // notice ---------------------------------------------------------------------------------------
  notice(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['notice'];
    await httpPost(context, data, _url, '通知設定成功', 'notice');
  }

  // notice ---------------------------------------------------------------------------------------
  noticeTemporary(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['notice'];
    await httpPost(context, data, _url, '通知設定成功', 'noticeTemporary');
  }

  // privacy-location -----------------------------------------------------------------------------
  privacyLocation(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['privacy_location'];
    await httpPost(context, data, _url, '定位設定成功', 'privacyLocation');
  }

  // privacy-location -----------------------------------------------------------------------------
  privacyTimetable(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['privacy_timetable'];
    await httpPost(context, data, _url, '隱私設定成功', 'privacyTimetable');
  }

  // theme ----------------------------------------------------------------------------------------
  themes(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['themes'];
    await httpPost(context, data, _url, '主題設定成功', 'themes');
  }

  // get_theme ------------------------------------------------------------------------------------
  getThemes(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_themes'];
    await httpGet(context, data, _url, 'getThemes');
    if (_responseBody != null) {
      _getThemes = GetThemesModel.fromJson(_responseBody);
    }
  }

  // get_theme ------------------------------------------------------------------------------------
  getLocation(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_location'];
    await httpGet(context, data, _url, 'getLocation');
    if (_responseBody != null) {
      _getLocation = GetLocationModel.fromJson(_responseBody);
    }
  }

  // get_timetable --------------------------------------------------------------------------------
  getTimetable(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_timetable'];
    await httpGet(context, data, _url, 'getTimetable');
    if (_responseBody != null) {
      _getTimetable = GetTimetableModel.fromJson(_responseBody);
    }
  }

  // get_notice -----------------------------------------------------------------------------------
  getNotice(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_notice'];
    await httpGet(context, data, _url, 'getNotice');
    if (_responseBody != null) {
      _getNotice = GetNoticeModel.fromJson(_responseBody);
    }
  }

  // get_timetable_notice -------------------------------------------------------------------------
  getTimetableNotice(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_timetable'];
    await httpGet(context, data, _url, 'getTimetableNotice');
    if (_responseBody != null) {
      _getTimetableNotice = GetTimetableNoticeModel.fromJson(_responseBody);
    }
  }

  // get_friend_privacy ---------------------------------------------------------------------------
  getFriendPrivacy(BuildContext context, Map<String, dynamic> data) async {
    String _url = settingUrl['get_friend_privacy'];
    await httpGet(context, data, _url, 'getFriendPrivacy');
    if (_responseBody != null) {
      _getFriendPrivacy = GetFriendPrivacyModel.fromJson(_responseBody);
    }
  }

  // PROFILE ===========================================================================================
  // edit-profile ---------------------------------------------------------------------------------
  editProfile(BuildContext context, Map<String, dynamic> data) async {
    String _url = profileUrl['edit_profile'];
    await httpPost(context, data, _url, '個人資料設定成功', 'editProfile');
  }

  // profile-list ---------------------------------------------------------------------------------
  getProfileList(BuildContext context, Map<String, dynamic> data) async {
    String _url = profileUrl['profile_list'];
    await httpGet(context, data, _url, 'getProfileList');
    if (_responseBody != null) {
      _getProfileList = GetProfileListModel.fromJson(_responseBody);
    }
  }
}
