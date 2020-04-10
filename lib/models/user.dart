import 'package:flutter_kirthan/exceptions/validation_exception.dart';

class UserLogin {
  //int id;
  //String userid;
  String username;
  String password;
  String usertype;

//Typically called form service layer to create a new user
  UserLogin({this.username, this.password, this.usertype});
//Typically called from the data_source layer after getting data from an external source.
  UserLogin.fromJson(Map<String, dynamic> map) {
    //id = map['id'];
    //userid = map['userid'];
    username = map['username'];
    password= map['password'];
    usertype= map['usertype'];
  }
//Typically called from service or data_source layer just before persisting data.
  //Here is the appropriate place to check data validity before persistence.
  Map<String, dynamic> toJson() {
    //validate
    _validation();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['id'] = this.id;
    //data['userid'] = this.userid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['usertype'] = this.usertype;
    return data;
  }
  _validation() {
    if (username == null) {
      //NullNameException is defined in the exception folder of the domain
      throw NullNameException('Name cannot be Null');
    }
  }


}

class UserRequest {
  final int id;
  String userId;
  String userName;
  String password;
  String userType;
  String firstName;
  String lastName;
  String email;
  int phoneNumber;
  String addLineOne;
  String addLineTwo;
  String addLineThree;
  String locality;
  String city;
  int pinCode;
  String state;
  String country;
  String govtIdType;
  String govtId;
  bool isProcessed;
  String createdBy;
  String createTime;
  String updatedBy;
  String updateTime;
  String approvalStatus;
  String approvalComments;


//Typically called form service layer to create a new user
  UserRequest({this.id, this.userId, this.userName, this.password, this.userType,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.addLineOne,
    this.addLineTwo,
    this.addLineThree,
    this.locality,
    this.city,
    this.pinCode,
    this.state,
    this.country,
    this.govtIdType,
    this.govtId,
    this.isProcessed,
    this.createdBy,
    this.updatedBy,
    this.updateTime,
    this.approvalStatus,
    this.approvalComments }
  );
//Typically called from the data_source layer after getting data from an external source.
  factory UserRequest.fromJson(Map<String, dynamic> data) {
    return UserRequest( id: data['id'],
      userId: data['userId'],
      userName: data['userName'] ,
      password: data['password'] ,
      userType: data['userType'] ,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      addLineOne: data['addLineOne'],
      addLineTwo: data['addLineTwo'],
      addLineThree: data['addLineThree'],
      locality: data['locality'],
      city: data['city'],
      pinCode: data['pinCode'],
      state: data['state'],
      country: data['country'],
      govtIdType: data['govtIdType'],
      govtId: data['govtId'],
      isProcessed: data['isProcessed'],
      createdBy: data['createdBy'],
      updatedBy: data['updatedBy'],
      updateTime: data['updateTime'],
      approvalStatus: data['approvalStatus'],
      approvalComments: data['approvalComments'],
    );
  }
  factory UserRequest.fromMap(Map<String, dynamic> map) {
  return UserRequest(
    id: map['id'],
    userId: map['userId'],
    userName: map['userName'],
    password: map['password'],
    userType: map['userType'],
    firstName: map['firstName'],
    lastName: map['lastName'],
    email: map['email'],
    phoneNumber: map['phoneNumber'],
    addLineOne: map['addLineOne'],
    addLineTwo: map['addLineTwo'],
    addLineThree: map['addLineThree'],
    locality: map['locality'],
    city: map['city'],
    pinCode: map['pinCode'],
    state: map['state'],
    country: map['country'],
    govtIdType: map['govtIdType'],
    govtId: map['govtId'],
    isProcessed: map['isProcessed'],
    createdBy: map['createdBy'],
    updatedBy: map['updatedBy'],
    updateTime: map['updateTime'],
    approvalStatus: map['approvalStatus'],
    approvalComments: map['approvalComments'],
  );
  }


//Typically called from service or data_source layer just before persisting data.
  //Here is the appropriate place to check data validity before persistence.
  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['userType'] = this.userType;
    data['firstName']=this.firstName;
    data['lastName']=this.lastName;
    data['email']=this.email;
    data['phoneNumber']=this.phoneNumber;
    data['addLineOne']=this.addLineOne;
    data['addLineTwo']=this.addLineTwo;
    data['addLineThree']=this.addLineThree;
    data['locality']=this.locality;
    data['city']=this.city;
    data['pinCode']=this.pinCode;
    data['state']=this.state;
    data['country']=this.country;
    data['govtIdType']=this.govtIdType;
    data['govtId']=this.govtId;
    data['isProcessed']=this.isProcessed;
    data['createdBy']=this.createdBy;
    data['createTime']=this.createTime;
    data['updatedBy']=this.updatedBy;
    data['updateTime']=this.updateTime;
    data['approvalStatus']=this.approvalStatus;
    data['approvalComments']=this.approvalComments;

    return data;
  }

  Map toStrJson() {

    return {
      "id":this.id,
      "userId":this.userId,
      "userName":this.userName,
      "userType":this.userType,
      "password":this.password,
      "firstName":this.firstName,
      "lastName":this.lastName,
      "email":this.email,
      "phoneNumber":this.phoneNumber,
      "addLineOne":this.addLineOne,
      "addLineTwo":this.addLineTwo,
      "addLineThree":this.addLineThree,
      "locality":this.locality,
      "city":this.city,
      "pinCode":this.pinCode,
      "state":this.state,
      "country":this.country,
      "govtIdType":this.govtIdType,
      "govtId":this.govtId,
      "isProcessed":this.isProcessed,
      "createdBy":this.createdBy,
      "updatedBy":this.updatedBy,
      "updateTime":this.updateTime,
      "createTime":this.createTime,
      "approvalStatus":this.approvalStatus,
      "approvalComments":this.approvalComments
    };

  }

}