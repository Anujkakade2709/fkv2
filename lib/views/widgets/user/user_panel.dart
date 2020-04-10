import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/user/user_list_item.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/views/pages/user/user_maintenance.dart';
import 'package:flutter_kirthan/views/pages/event/event_maintenance.dart';

class UsersPanel extends StatelessWidget {
  String userType;
  UsersPanel({this.userType});
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<UserRequest>>(
          future: model.userrequests,
          builder: (_, AsyncSnapshot<List<UserRequest>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var userRequests = snapshot.data;
                  return new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: const Text("Super Admin"),
                            onPressed: () {
                              print("Super Admin");
                              model.setUserRequests("SA");
                            },
                          ),
                          RaisedButton(
                            child: const Text("Admin"),
                            onPressed: () {
                              print("Admin");
                              model.setUserRequests("A");
                            },
                          ),
                          RaisedButton(
                            child: const Text("User"),
                            onPressed: () {
                              print("Users");
                              model.setUserRequests("U");
                            },
                          ),
                          Expanded(
                            child: RaisedButton(
                              child: const Text("Create an User Request"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserWrite()));
                              },
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            userRequests == null ? 0 : userRequests.length,
                        itemBuilder: (_, int index) {
                          var userrequest = userRequests[index];
                          return UserRequestsListItem(userrequest: userrequest);
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      //await model.setSuperAdminUserRequests("SuperAdmin");
                      await model.setUserRequests("All");
                      //await model.setUserdetails();
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}
