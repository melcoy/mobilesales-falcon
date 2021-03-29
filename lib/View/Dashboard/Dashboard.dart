import 'package:flutter/material.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';

class Dashboard extends StatelessWidget {
  static const idScreen = "dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderDashboard(),
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
