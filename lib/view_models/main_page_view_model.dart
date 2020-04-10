import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/models/team.dart';


class MainPageViewModel extends Model {
  Future<List<UserRequest>> _userrequests;
  Future<List<EventRequest>> _eventrequests;
  Future<List<team>> _teamrequests;


  Future<List<UserRequest>> get userrequests => _userrequests;
  Future<List<EventRequest>> get eventrequests => _eventrequests;
  Future<List<team>> get teamrequests => _teamrequests;


  set userrequests(Future<List<UserRequest>> value) {
    _userrequests = value;
    notifyListeners();
  }



  set eventrequests(Future<List<EventRequest>> value) {
    _eventrequests = value;
    notifyListeners();
  }

  set teamrequests(Future<List<team>> value) {
    _teamrequests = value;
    notifyListeners();
  }


  final IKirthanRestApi apiSvc;

  MainPageViewModel({@required this.apiSvc});


  Future<bool> setUserRequests(String userType) async {
    userrequests = apiSvc?.getUserRequests(userType);
    return userrequests != null;
  }

  /*
  Future<bool> setSuperAdminUserRequests(String userType) async {
    superadminusers = apiSvc?.getUserRequests(userType);
    return superadminusers != null;
  }
*/
  Future<bool> setEventRequests(String eventType) async {
    eventrequests = apiSvc?.getEventRequests(eventType);
    return eventrequests != null;
  }

  Future<bool> setTeamRequests(String teamTitle) async {
    teamrequests = apiSvc?.getTeamRequests(teamTitle);
    return teamrequests != null;
  }

}
