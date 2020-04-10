import 'dart:async';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/models/team.dart';


abstract class IKirthanRestApi {
  //Sample
  Future<List<UserRequest>> getUserRequestsFromJson();

  //user
  Future<List<UserRequest>> getUserRequests(String userType);
  Future<List<UserRequest>> getDummyUserRequests();
  Future<UserRequest> submitNewUserRequest(Map<String,dynamic> userrequestmap);
  Future<bool> processUserRequest(Map<String,dynamic> processrequestmap);
  Future<bool> deleteUserRequest(Map<String,dynamic> processrequestmap);
  Future<void> submitUpdateUserRequest(String userrequestmap);


  //event
  Future<List<EventRequest>> getEventRequests(String userType);
  Future<EventRequest> submitNewEventRequest(Map<String,dynamic> eventrequestmap);
  Future<List<EventRequest>> getDummyEventRequests();
  Future<bool> processEventRequest(Map<String,dynamic> processrequestmap);
  Future<bool> deleteEventRequest(Map<String,dynamic> processrequestmap);
  Future<void> submitUpdateEventRequest(String eventrequestmap);

  //team
  Future<List<team>> getTeamRequests(String teamTitle);
  Future<team> submitNewTeamRequest(Map<String,dynamic> teamrequestmap);
  Future<void> submitUpdateTeamRequest(String teamrequestmap);
  //Future<List<EventRequest>> getDummyEventRequests();
  Future<bool> processTeamRequest(Map<String,dynamic> processrequestmap);
  Future<bool> deleteTeamRequest(Map<String,dynamic> processrequestmap);
}