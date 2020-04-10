import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/team.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TeamWrite extends StatefulWidget {
  TeamWrite({Key key}) : super(key: key);

  @override
  _TeamWriteState createState() => _TeamWriteState();

}
class _TeamWriteState extends State<TeamWrite> {

  final _formKey = GlobalKey<FormState>();
  team teamrequest = new team();
  final IKirthanRestApi apiSvc = new RestAPIServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.redAccent,
          child: Center(
            child:Form(
              // context,
              key: _formKey,
              autovalidate: true,
              // readonly: true,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(top: 50)
                  ),



                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child:TextFormField(
                        //attribute: "eventTitle",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.title),
                          labelText: "Title",
                          hintText: "",
                        ),
                        onSaved: (input){
                          teamrequest.teamTitle = input;
                        },
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                    ),
                    elevation: 5,
                  ),

                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child:TextFormField(
                        //attribute: "Description",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.description),
                          labelText: "Description",
                          hintText: "",
                        ),
                        onSaved: (input){
                          teamrequest.teamDescription = input;
                        },
                        validator: (value) {
                          if(value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                    ),
                    elevation: 5,
                  ),



                  new Container(
                      margin: const EdgeInsets.only(top: 40)
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                          color: Colors.blue,
                          onPressed: () {

                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              teamrequest.isProcessed = false;
                              teamrequest.createdBy = "SYSTEM";
                              String dt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(DateTime.now());
                              teamrequest.createTime =  dt;
                              teamrequest.updatedBy = "SYSTEM";
                              teamrequest.updateTime = dt;
                              teamrequest.approvalStatus = "Approved";
                              teamrequest.approvalComments = "AAA";


                              Map<String,dynamic> teammap = teamrequest.toJson();
                              apiSvc?.submitNewTeamRequest(teammap);
                            }
                            //String s = jsonEncode(userrequest.mapToJson());
                            //service.registerUser(s);
                            //print(s);
                          }
                      ),
                      /*MaterialButton(
                        child: Text("Reset",style: TextStyle(color: Colors.white),),
                        color: Colors.pink,
                        onPressed: () {
                          _fbKey.currentState.reset();
                        },
                      ),*/
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }

}

