import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Bloc/Dashboard/bloc/dashboardbloc_bloc.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';

class Dashboard extends StatelessWidget {
  static const idScreen = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorRedFigma,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {},
          ),
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
