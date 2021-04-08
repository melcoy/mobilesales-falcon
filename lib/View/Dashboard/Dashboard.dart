import 'package:flutter/material.dart';
import 'package:salesappmobile/ApiServices/Customer/customer_repo.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';

class Dashboard extends StatelessWidget {
  static const idScreen = "dashboard";
  final CustomerRepo _apiCustomerRepo = CustomerRepo();
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
            onPressed: () async {
              // bool login = await _apiCustomerRepo.fetchListCustomer();
            },
          ),
        ],
      ),
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
