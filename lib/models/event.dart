
class EventRequest {
  final int eventId;
  String eventTitle;
  String eventDescription;
  String eventDate;
  String eventDuration;
  String eventLocation;
  String eventType;
  int phoneNumber;
  String addLineOne;
  String addLineTwo;
  String addLineThree;
  String locality;
  String city;
  int pinCode;
  String state;
  String country;
  bool isProcessed;
  String createdBy;
  String createTime;
  String updatedBy;
  String updateTime;
  String approvalStatus;
  String approvalComments;


//Typically called form service layer to create a new user
  EventRequest(
      {this.eventId, this.eventTitle, this.eventDescription, this.eventDate, this.eventDuration,
        this.eventLocation,
        this.eventType,
        this.phoneNumber,
        this.addLineOne,
        this.addLineTwo,
        this.addLineThree,
        this.locality,
        this.city,
        this.pinCode,
        this.state,
        this.country,
        this.isProcessed,
        this.createdBy,
        this.updatedBy,
        this.createTime,
        this.updateTime,
        this.approvalStatus,
        this.approvalComments });

//Typically called from the data_source layer after getting data from an external source.
  factory EventRequest.fromJson(Map<String, dynamic> data) {
    return EventRequest(
      eventId: data['eventId'],
      eventTitle: data['eventTitle'],
      eventDescription: data['eventDescription'],
      eventDate: data['eventDate'],
      eventDuration: data['eventDuration'],
      eventLocation: data['eventLocation'],
      eventType: data['eventType'],
      phoneNumber: data['phoneNumber'],
      addLineOne: data['addLineOne'],
      addLineTwo: data['addLineTwo'],
      addLineThree: data['addLineThree'],
      locality: data['locality'],
      city: data['city'],
      pinCode: data['pinCode'],
      state: data['state'],
      country: data['country'],
      isProcessed: data['isProcessed'],
      createdBy: data['createdBy'],
      updatedBy: data['updatedBy'],
      updateTime: data['updateTime'],
      createTime: data['createTime'],
      approvalStatus: data['approvalStatus'],
      approvalComments: data['approvalComments'],
    );
  }

  factory EventRequest.fromMap(Map<String, dynamic> map) {
    return EventRequest(
      eventId: map['eventId'],
      eventTitle: map['eventTitle'],
      eventDescription: map['eventDescription'],
      eventDate: map['eventDate'],
      eventDuration: map['eventDuration'],
      eventLocation: map['eventLocation'],
      eventType: map['eventTitle'],
      phoneNumber: map['phoneNumber'],
      addLineOne: map['addLineOne'],
      addLineTwo: map['addLineTwo'],
      addLineThree: map['addLineThree'],
      locality: map['locality'],
      city: map['city'],
      pinCode: map['pinCode'],
      state: map['state'],
      country: map['country'],
      isProcessed: map['isProcessed'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      updateTime: map['updateTime'],
      createTime: map['createTime'],
      approvalStatus: map['approvalStatus'],
      approvalComments: map['approvalComments'],
    );
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventId'] = this.eventId;
    data['eventTitle'] = this.eventTitle;
    data['eventDescription'] = this.eventDescription;
    data['eventDate'] = this.eventDate;
    data['eventDuration'] = this.eventDuration;
    data['eventLocation'] = this.eventLocation;
    data['eventType'] = this.eventTitle;
    data['phoneNumber'] = this.phoneNumber;
    data['addLineOne'] = this.addLineOne;
    data['addLineTwo'] = this.addLineTwo;
    data['addLineThree'] = this.addLineThree;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['pinCode'] = this.pinCode;
    data['state'] = this.state;
    data['country'] = this.country;
    data['isProcessed'] = this.isProcessed;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['updateTime'] = this.updateTime;
    data['createTime']=this.createTime;
    data['approvalStatus'] = this.approvalStatus;
    data['approvalComments'] = this.approvalComments;

    return data;
  }

  Map toStrJson() {

    return {
      "eventId":this.eventId,
      "eventTitle":this.eventTitle,
      "eventDescription":this.eventDescription,
      "eventDate":this.eventDate,
      "eventDuration":this.eventDuration,
      "eventLocation":this.eventLocation,
      "eventType":this.eventTitle,
      "phoneNumber":this.phoneNumber,
      "addLineOne":this.addLineOne,
      "addLineTwo":this.addLineTwo,
      "addLineThree":this.addLineThree,
      "locality":this.locality,
      "city":this.city,
      "pinCode":this.pinCode,
      "state":this.state,
      "country":this.country,
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