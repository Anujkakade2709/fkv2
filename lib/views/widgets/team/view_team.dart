import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/team.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';



class EditProfileView extends StatefulWidget {
  team teamrequest ;

  EditProfileView({Key key, @required this.teamrequest}) : super(key: key);

  @override
  _EditProfileViewState createState() => new _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  team teamrequest= new team();
  final IKirthanRestApi apiSvc = new RestAPIServices();



  final TextEditingController _teamTitleController = new TextEditingController();
  String teamTitle ;
  final TextEditingController _teamDescriptionController = new TextEditingController();
  String teamDescription ;



  @override
  void initState() {
    _teamTitleController.text = widget.teamrequest.teamTitle;
    _teamDescriptionController.text = widget.teamrequest.teamDescription;

    return super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final DateTime today = new DateTime.now();

    return new Scaffold(
        appBar: new AppBar(title: const Text('Edit Profile'), actions: <Widget>[
          new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0),
              child: new MaterialButton(
                color: themeData.primaryColor,
                textColor: themeData.secondaryHeaderColor,
                child: new Text('Save'),
                onPressed: () {
                  // _handleSubmitted();
                  _formKey.currentState.save();
                  Navigator.pop(context);
                  print(widget.teamrequest.teamTitle);
                  print(widget.teamrequest.teamDescription);
                  String teamrequestStr = jsonEncode(widget.teamrequest.toStrJson());
                  apiSvc?.submitUpdateTeamRequest(teamrequestStr);
                },
              ))
        ]),

        body: new Form(
            key: _formKey,
            autovalidate: true,
            //onWillPop: _warnUserAboutInvalidData,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Team Title", hintText: "What do people call this event?"),
                    autocorrect: false,
                    controller: _teamTitleController,
                    onSaved: (String value) {
                      widget.teamrequest.teamTitle = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Description"),
                    autocorrect: false,
                    controller: _teamDescriptionController,
                    onSaved: (String value) {
                      widget.teamrequest.teamDescription = value;
                    },
                  ),
                ),


              ],
            )));
  }
}