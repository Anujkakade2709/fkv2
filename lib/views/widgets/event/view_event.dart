import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/services/data_services.dart';
/*import 'package:flutter_kirthan/services/data_services.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'dart:async';
import 'package:flutter/material.dart';*/


class EditProfileView extends StatefulWidget {
  EventRequest eventrequest ;
  EditProfileView({Key key, @required this.eventrequest}) : super(key: key);

  @override
  _EditProfileViewState createState() => new _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  //EventRequest eventrequestobj = new EventRequest();
  //_EditProfileViewState({Key key, @required this.eventrequest}) ;
  final IKirthanRestApi apiSvc = new RestAPIServices();
  String _selectedState;
  String state;
  var _states = ["GOA","GUJ","MAH"];
  // controllers for form text controllers
  final TextEditingController _eventTitleController = new TextEditingController();
  String eventTitle ;
  final TextEditingController _eventTypeController = new TextEditingController();
  String eventType ;
  final TextEditingController _eventDateController = new TextEditingController();
  String eventDate ;
  final TextEditingController _eventDescriptionController = new TextEditingController();
  String eventDescription ;
  final TextEditingController _eventAddressController = new TextEditingController();
  String address ;
  final TextEditingController _eventDurationController = new TextEditingController();
  String eventDuration ;
  final TextEditingController _linetwoController = new TextEditingController();
  String lineTwo;
  final TextEditingController _linethreeController = new TextEditingController();
  String lineThree;
  final TextEditingController _cityController = new TextEditingController();
  String city;
  final TextEditingController _pincodeController = new TextEditingController();
  String pinCode;


  @override
  void initState() {
    _eventTitleController.text = widget.eventrequest.eventTitle;
    _eventTypeController.text = widget.eventrequest.eventType;
    _eventDateController.text = widget.eventrequest.eventDate;
    _eventDescriptionController.text = widget.eventrequest.eventDescription;
    _eventAddressController.text = widget.eventrequest.addLineOne;
    _eventDurationController.text = widget.eventrequest.eventDuration;
    _linetwoController.text = widget.eventrequest.addLineTwo;
    _linethreeController.text = widget.eventrequest.addLineThree;
    _pincodeController.text = widget.eventrequest.pinCode.toString();
    _selectedState="GUJ";
    _cityController.text=widget.eventrequest.city;
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
                  print(eventTitle);
                  print(eventDate);
                  print(eventDuration);
                  print(widget.eventrequest.eventDescription);
                  //Map<String,dynamic> eventmap = widget.eventrequest.toJson();
                  //String eventmap = widget.eventrequest.toStrJsonJson();
                  String eventrequestStr = jsonEncode(widget.eventrequest.toStrJson());
                  apiSvc?.submitUpdateEventRequest(eventrequestStr);
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
                    decoration: const InputDecoration(labelText: "Event Title", hintText: "What do people call this event?"),
                    autocorrect: false,
                    controller: _eventTitleController,
                    onSaved: (String value) {
                      eventTitle = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Event Type"),
                    autocorrect: false,
                    controller: _eventTypeController,
                    onSaved: (String value) {
                      eventType = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Date"),
                    autocorrect: false,
                    controller: _eventDateController,
                    onSaved: (String value) {
                      eventDate = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Event Duration"),
                    autocorrect: false,
                    controller: _eventDurationController,
                    onSaved: (String value) {
                      eventDuration = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Description"),
                    autocorrect: false,
                    controller: _eventDescriptionController,
                    onSaved: (String value) {
                      widget.eventrequest.eventDescription = value;
                    },
                  ),
                ),

                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Address"),
                    autocorrect: false,
                    controller: _eventAddressController,
                    onSaved: (String value) {
                      address = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Line 2"),
                    autocorrect: false,
                    controller: _linetwoController,
                    onSaved: (String value) {
                      lineTwo = value;
                    },
                  ),
                ),


                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Line 3"),
                    autocorrect: false,
                    controller: _linethreeController,
                    onSaved: (String value) {
                      lineThree = value;
                    },
                  ),
                ),

                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "PinCode"),
                    autocorrect: false,
                    controller: _pincodeController,
                    onSaved: (String value) {
                      pinCode = value;
                    },
                  ),
                ),

                /*new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "Locality"),
                    autocorrect: false,
                    controller: _linethreeController,
                    onSaved: (String value) {
                      lineThree = value;
                    },
                  ),
                ),
*/
                new Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(labelText: "City"),
                    autocorrect: false,
                    controller: _cityController,
                    onSaved: (String value) {
                      city = value;
                    },
                  ),
                ),

                DropdownButtonFormField<String>(
                  value: _selectedState,
                  icon: const Icon(Icons.location_city),
                  hint: Text('Select State'),
                  items: _states
                      .map((state) => DropdownMenuItem(
                    value: state,
                    child: Text(state),
                  )).toList(),
                  onChanged: (input) {
                    setState(() {
                      _selectedState = input;
                    });
                  },
                  onSaved: (input) {
                    state = input;
                  },

                ),

              ],
            )));
  }
}