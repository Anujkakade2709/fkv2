//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/utils/kirthan_styles.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/views/widgets/user/view_user.dart';

class UserRequestsListItem extends StatelessWidget {
  final UserRequest userrequest;
  final IKirthanRestApi apiSvc = new RestAPIServices();
  UserRequestsListItem({@required this.userrequest});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      userrequest?.userId,
      style: TextStyle(
        color: KirthanStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: KirthanStyles.titleFontSize,
      ),
    );

    var subTitle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.movie,
          color: KirthanStyles.subTitleColor,
          size: KirthanStyles.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            userrequest?.userName,
            style: TextStyle(
              color: KirthanStyles.subTitleColor,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              child: userrequest.isProcessed? const Text("Processed"):const Text("Not Processed"),
              onPressed: () {
                Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                processrequestmap["id"] = userrequest?.id;
                processrequestmap["approvalstatus"] = "Approved";
                processrequestmap["approvalcomments"] = "ApprovalComments";
                processrequestmap["usertype"] = userrequest?.userType;
                apiSvc?.processUserRequest(processrequestmap);
              },
            ),
          ],
        ),


        Row(
          children: <Widget>[
            SizedBox(
              height: 35,
              width: 55,
              child: RaisedButton(
                child: const Text("Delete"),
                onPressed: () {
                  Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                  processrequestmap["id"] = userrequest?.id;
                  apiSvc?.deleteUserRequest(processrequestmap);
                },
              ),
            ),
          ],
        ),

        Row(
          children: <Widget>[
            SizedBox(
              height: 35,
              width: 55,
              child: RaisedButton(
                child: const Text("Edit"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileView(userrequest:userrequest)),);
                },
              ),
            ),
          ],
        ),

      ],
    );






    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }
}