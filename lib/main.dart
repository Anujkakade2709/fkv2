import 'package:flutter/material.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/pages/main_page.dart';

final MainPageViewModel mainPageVM = MainPageViewModel(apiSvc: RestAPIServices());

void main() => runApp(KirthanApp(mainPageVM: mainPageVM));

class KirthanApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  KirthanApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kirthan Application',
      theme: new ThemeData(
        primaryColor: Color(0xff070707),
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
  }
}
