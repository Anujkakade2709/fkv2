import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/utils/kirthan_styles.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/views/widgets/event/view_event.dart';


class EventRequestsListItem extends StatelessWidget {
  final EventRequest eventrequest;
  final UserRequest userrequests;
  final IKirthanRestApi apiSvc = new RestAPIServices();

  EventRequestsListItem({@required this.eventrequest,@required this.userrequests});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      eventrequest?.eventTitle,
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
            eventrequest?.eventDescription,
            style: TextStyle(
              color: KirthanStyles.subTitleColor,
            ),
          ),
        ),

        Row(
          children: <Widget>[
            SizedBox(
    height: 35,
    width: 65,

    child: RaisedButton(
              child: eventrequest.isProcessed? const Text("Processed"):const Text("Not Processed"),
              onPressed: () {
                Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                processrequestmap["eventId"] = eventrequest?.eventId;
                processrequestmap["approvalstatus"] = "Approved";
                processrequestmap["approvalcomments"] = "ApprovalComments";
                processrequestmap["eventType"] = eventrequest?.eventType;
                apiSvc?.processEventRequest(processrequestmap);
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
              child: const Text("Delete"),
              onPressed: () {
                Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                processrequestmap["eventId"] = eventrequest?.eventId;
                apiSvc?.deleteEventRequest(processrequestmap);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileView(eventrequest: eventrequest)),);
//updateEvent
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