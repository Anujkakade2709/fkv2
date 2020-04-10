import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/event/event_list_item.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/views/pages/event/event_maintenance.dart';

class EventsPanel extends StatelessWidget {
  String eventType;
  EventsPanel({this.eventType});
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<EventRequest>>(
          future: model.eventrequests,
          builder: (_, AsyncSnapshot<List<EventRequest>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var eventRequests = snapshot.data;
                  return new Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                     new Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         RaisedButton(
                           child: const Text("Today"),
                           onPressed: () {print("Today"); model.setEventRequests("1");},
                         ),
                         RaisedButton(
                           child: const Text("Tomorrow"),
                           onPressed: null,
                         ),
                         RaisedButton(
                           child: const Text("This Week"),
                           onPressed: null,
                         ),
                         Expanded(
                           child:
                         RaisedButton(
                           child: const Text("Create an Event"),
                           onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => EventWrite()));
                           },
                         ),
                         ),
                       ],
                     ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: eventRequests == null ? 0 : eventRequests
                            .length,
                        itemBuilder: (_, int index) {
                          var eventrequest = eventRequests[index];
                          return EventRequestsListItem(
                              eventrequest: eventrequest);
                        },
                      ),
                    ],
                  );
                }
                else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      //await model.setSuperAdminUserRequests("SuperAdmin");
                      await model.setUserRequests("All");
                      await model.setEventRequests("All");
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