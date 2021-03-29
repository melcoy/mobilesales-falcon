import 'package:flutter/material.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanMenu.dart';
import 'View/Login/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: LoginScreen.idScreen,
      routes: {
        LoginScreen.idScreen: (context) => LoginScreen(),
        // Dashboard.idScreen: (context) => Dashboard(),
        '/VisitPlan': (BuildContext context) => new VisitPlanMenu(),
      },
    );
  }
}
