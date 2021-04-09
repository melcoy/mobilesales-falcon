import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salesappmobile/Bloc/Login/bloc/loginbloc_bloc.dart';


import 'package:salesappmobile/Bloc/Spesification/bloc/listspesificationbloc_bloc.dart';

import 'package:salesappmobile/View/Dashboard/Menu/Report/ReportSales.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Spesification/ListTruck.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanMenu.dart';
import 'Bloc/Menu/Customer/ListCustomer/bloc/listcustomerbloc_bloc.dart';
import 'View/Dashboard/Menu/Customer/ListCustomer.dart';
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
        LoginScreen.idScreen: (context) => BlocProvider<LoginblocBloc>(
            create: (BuildContext context) => LoginblocBloc(),
            child: LoginScreen()),
        '/VisitPlan': (BuildContext context) => new VisitPlanMenu(),
        '/ListCustomer': (context) => BlocProvider<ListcustomerblocBloc>(
              create: (BuildContext context) => ListcustomerblocBloc(),
              child: ListCustomer(),
            ),
        '/ListTruck': (context) => BlocProvider<ListspesificationblocBloc>(
              create: (BuildContext context) => ListspesificationblocBloc(),
              child: ListTruck(),
            ),
        '/ReportSales': (BuildContext context) => new ReportSales(),
      },
    );
  }
}
