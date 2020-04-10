import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';

class UserWrite extends StatefulWidget {
  UserWrite({Key key}) : super(key: key);

  @override
  _UserWriteState createState() => _UserWriteState();

}
class _UserWriteState extends State<UserWrite> {

  final _formKey = GlobalKey<FormState>();
  UserRequest userrequest = new UserRequest();
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

                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 30,
                        //attribute: "Username",
                        decoration: InputDecoration(
                            icon: const Icon(Icons.tag_faces),
                            hintText: "",
                            labelText:"Username"
                        ),
                        onSaved: (input){
                          userrequest.userName = input;
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
                        //attribute: "Password",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.security),
                          labelText: "Password",
                          hintText: "",
                        ),
                        onSaved: (input){
                          userrequest.password = input;
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
                        //attribute: "FirstName",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.people_outline),
                          labelText: "FirstName",
                          hintText: "",
                        ),
                        onSaved: (input){
                          userrequest.firstName = input;
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
                        //attribute: "LastName",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.people),
                          labelText: "LastName",
                          hintText: "",
                        ),
                        onSaved: (input){
                          userrequest.lastName = input;
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
                        //attribute: "Email",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.email),
                          labelText: "Email",
                          hintText: "",
                        ),
                        onSaved: (input){
                          userrequest.email = input;
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
                        //attribute: "Phonenumber",
                        decoration: InputDecoration(
                          icon: const Icon(Icons.phone_iphone),
                          labelText: "PhoneNumber",
                          hintText: "",
                        ),
                        onSaved: (input){
                          userrequest.phoneNumber = int.parse(input);
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
                            userrequest.addLineOne = input;
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
                            userrequest.addLineTwo = input;
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
                            userrequest.addLineThree = input;
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
                            userrequest.locality = input;
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
                            userrequest.pinCode = int.parse(input);
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
                              userrequest.city = input;
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
                            userrequest.state = input;
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
                            userrequest.country = input;
                          },
                        ),

                      ],
                    ),
                    elevation: 5,
                  ),


                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            //attribute: "govtidtype",
                            decoration: InputDecoration(
                              icon: const Icon(Icons.perm_identity),
                              labelText: "GovtID Type",
                              hintText: "",
                            ),
                            onSaved: (input){
                              userrequest.govtIdType = input;
                            },
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            //attribute: "Govtid",
                            decoration: InputDecoration(
                              icon: const Icon(Icons.perm_identity),
                              labelText: "Govtid",
                              hintText: "",
                            ),
                            onSaved: (input){
                              userrequest.govtId = input;
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
                            userrequest.userId = userrequest.firstName + '_' + userrequest.lastName;
                            userrequest.userType = "Admin";
                            userrequest.isProcessed = false;
                            userrequest.createdBy = "SYSTEM";
                            String dt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(DateTime.now());
                            userrequest.createTime =  dt;
                            userrequest.updatedBy = "SYSTEM";
                            userrequest.updateTime = dt;
                            userrequest.approvalStatus = "Approved";
                            userrequest.approvalComments = "AAA";
                            Map<String,dynamic> usermap = userrequest.toJson();
                            apiSvc?.submitNewUserRequest(usermap);
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


