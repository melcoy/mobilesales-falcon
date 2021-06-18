import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salesappmobile/Bloc/Dashboard/bloc/dashboardbloc_bloc.dart';
import 'package:salesappmobile/Bloc/Login/bloc/loginbloc_bloc.dart';
import 'package:salesappmobile/Util/SizeConfig.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';
import 'package:salesappmobile/View/Login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static const idScreen = "dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    checkIsLogin();
  }

  Future<Null> checkIsLogin() async {
    String _token = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("session");
    if (_token != "" && _token != null) {
      print("alreay login.");
      //your home page is loaded
    } else {
      //replace it with the login page
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider<LoginblocBloc>(
                    create: (context) => LoginblocBloc(),
                    child: LoginScreen(),
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorRedFigma,
        actions: [
          Icon(
            Icons.logout,
            color: Colors.white,
            size: 30,
          ),
          TextButton(
              child: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockVertical * 2),
              ),
              onPressed: () {
                deleteSession();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider<LoginblocBloc>(
                              create: (context) => LoginblocBloc(),
                              child: LoginScreen(),
                            )));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocProvider<DashboardblocBloc>(
                create: (BuildContext context) => DashboardblocBloc(),
                child: HeaderDashboard()),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Text(
                    dateFormat(),
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            MenuDashboard(),
          ],
        ),
      ),
    );
  }
}
