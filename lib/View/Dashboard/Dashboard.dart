import 'package:flutter/material.dart';
import 'package:salesappmobile/ApiServices/Master/master_repo.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';

class Dashboard extends StatelessWidget {
  static const idScreen = "dashboard";
  final MasterRepo _masterRepo = MasterRepo();
  //final CustomerRepo _customerRepo = CustomerRepo();
  List<dynamic> kotaList = [];
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
              kotaList = await _masterRepo.fetchListKota();
              print(kotaList);
              //bool cust = await _customerRepo.fetchAddCustomer();
              //print("Cus" + cust.toString());
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
