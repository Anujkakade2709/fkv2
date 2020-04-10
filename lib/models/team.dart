
class team {
  final int teamId;
  String teamTitle;
  String teamDescription;
  bool isProcessed;
  String createdBy;
  String createTime;
  String updatedBy;
  String updateTime;
  String approvalStatus;
  String approvalComments;


//Typically called form service layer to create a new user
  team({this.teamId, this.teamTitle, this.teamDescription, this.isProcessed,
    this.createdBy,
    this.updatedBy,
    this.createTime,
    this.updateTime,
    this.approvalStatus,
    this.approvalComments });

//Typically called from the data_source layer after getting data from an external source.
  factory team.fromJson(Map<String, dynamic> data) {
    return team(
      teamId: data['teamId'],
      teamTitle: data['teamTitle'],
      teamDescription: data['teamDescription'],
      isProcessed: data['isProcessed'],
      createdBy: data['createdBy'],
      updatedBy: data['updatedBy'],
      updateTime: data['updateTime'],
      createTime: data['createTime'],
      approvalStatus: data['approvalStatus'],
      approvalComments: data['approvalComments'],
    );
  }

  factory team.fromMap(Map<String, dynamic> map) {
    return team(
      teamId: map['teamId'],
      teamTitle: map['teamTitle'],
      teamDescription: map['teamDescription'],
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
    data['teamId'] = this.teamId;
    data['teamTitle'] = this.teamTitle;
    data['teamDescription'] = this.teamDescription;
    data['isProcessed'] = this.isProcessed;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['updateTime'] = this.updateTime;
    data['createTime'] = this.createTime;
    data['approvalStatus'] = this.approvalStatus;
    data['approvalComments'] = this.approvalComments;

    return data;
  }

  Map toStrJson() {
    return {
      "teamId": this.teamId,

      "teamDescription": this.teamDescription,

      "teamTitle": this.teamTitle,

      "isProcessed": this.isProcessed,
      "createdBy": this.createdBy,
      "updatedBy": this.updatedBy,
      "updateTime": this.updateTime,
      "createTime": this.createTime,
      "approvalStatus": this.approvalStatus,
      "approvalComments": this.approvalComments
    };
  }

}