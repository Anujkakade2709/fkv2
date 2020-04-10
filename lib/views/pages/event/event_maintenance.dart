import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class EventWrite extends StatefulWidget {
  EventWrite({Key key}) : super(key: key);

  @override
  _EventWriteState createState() => _EventWriteState();

}
class _EventWriteState extends State<EventWrite> {

  final _formKey = GlobalKey<FormState>();
  EventRequest eventrequest = new EventRequest();
  final IKirthanRestApi apiSvc = new RestAPIServices();
  List<String> _states = [ "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"];

  List<String> _cities = ['Adilabad',
    'Anantapur',
    'Chittoor',
    'Kakinada',
    'Guntur',
    'Hyderabad'];
  String _selectedCity;
  String _selectedState;
  String _selectedCountry;

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

                  /* Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 30,
                        //attribute: "Username",
                        decoration: InputDecoration(
                            icon: const Icon(Icons.tag_faces),
                            hintText: "",
                            labelText:"eventID"
                        ),
                        onSaved: (input){
                          eventrequest.eventId = input;
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
                  ),*/

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
                          eventrequest.eventTitle = input;
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
                          eventrequest.eventDescription = input;
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
                  /*Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child:TextFormField(
                        //attribute: "Date",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.timelapse),
                          labelText: "Date",
                          hintText: "",
                        ),
                        onSaved: (input){
                          eventrequest.eventDate = input;
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
                  ),*/
                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Text("Select Event Date"),
                          DateTimeField(
                            format: DateFormat("yyyy-MM-dd"),
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));},
                            onSaved: (input){
                              eventrequest.eventDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(input).toString();
                            },
                            validator: (value) {
                              if(value.toString().isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),

                        ],



                      ),
                    ),
                    elevation: 5,
                  ),
                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child:TextFormField(
                        //attribute: "Duration",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.timelapse),
                          labelText: "Duration",
                          hintText: "",
                        ),
                        onSaved: (input){
                          eventrequest.eventDuration = input;
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
                        //attribute: "Location",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.location_city),
                          labelText: "Location",
                          hintText: "",
                        ),
                        onSaved: (input){
                          eventrequest.eventLocation = input;
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
                        //attribute: "Type",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.low_priority),
                          labelText: "Type",
                          hintText: "",
                        ),
                        onSaved: (input){
                          eventrequest.eventType = input;
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
                        //attribute: "PhoneNumber",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.phone_iphone),
                          labelText: "PhoneNumber",
                          hintText: "",
                        ),
                        onSaved: (input){
                          eventrequest.phoneNumber = int.parse(input);
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
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          //attribute: "Address",
                          decoration: InputDecoration(
                            icon: const Icon(Icons.home),
                            labelText: "Address",
                            hintText: "",
                          ),
                          onSaved: (input){
                            eventrequest.addLineOne = input;
                          },
                          validator: (value) {
                            if(value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          //attribute: "line2",
                          decoration: InputDecoration(

                            labelText: "Line 2",
                            hintText: "",
                          ),
                          onSaved: (input){
                            eventrequest.addLineTwo = input;
                          },
                          validator: (value) {
                            if(value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          //attribute: "line3",
                          decoration: InputDecoration(

                            labelText: "Line 3",
                            hintText: "",
                          ),
                          onSaved: (input){
                            eventrequest.addLineThree = input;
                          },
                          validator: (value) {
                            if(value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },

                        ),
                        TextFormField(
                          //attribute: "locality",
                          decoration: InputDecoration(

                            labelText: "Locality",
                            hintText: "",
                          ),
                          onSaved: (input){
                            eventrequest.locality = input;
                          },
                          validator: (value) {
                            if(value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          //attribute: "PinCode",
                          decoration: InputDecoration(
                            labelText: "PinCode",
                            hintText: "",
                          ),
                          onSaved: (input){
                            eventrequest.pinCode = int.parse(input);
                          },
                          validator: (value) {
                            if(value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    elevation: 5,
                  ),



                  Card(
                    child: Column(
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          value: _selectedCity,
                          icon: const Icon(Icons.location_city),
                          hint: Text('Select City'),
                          items: _cities
                              .map((city) => DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          )).toList(),

                          onChanged: (input) {
                            setState(() {
                              _selectedCity = input;
                            });
                          },
                          onSaved: (input) {
                            eventrequest.city = input;
                          },
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
                            eventrequest.state = input;
                          },

                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedCountry,
                          icon: const Icon(Icons.location_city),
                          hint: Text('Select Country'),
                          items: ['IND']
                              .map((country) => DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          )).toList(),
                          onChanged: (input) {
                            setState(() {
                              _selectedCountry = input;
                            });
                          },
                          onSaved: (input) {
                            eventrequest.country = input;
                          },
                        ),

                      ],
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
                              eventrequest.isProcessed = false;
                              eventrequest.createdBy = "SYSTEM";
                              String dt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(DateTime.now());
                              eventrequest.createTime =  dt;
                              eventrequest.updatedBy = "SYSTEM";
                              eventrequest.updateTime = dt;
                              eventrequest.approvalStatus = "Approved";
                              eventrequest.approvalComments = "AAA";
                              //print(userrequest.city);
                              Map<String,dynamic> eventmap = eventrequest.toJson();
                              apiSvc?.submitNewEventRequest(eventmap);
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

