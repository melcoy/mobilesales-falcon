import 'package:flutter/material.dart';

import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Header/HeaderDashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/MenuDashboard.dart';

class Dashboard extends StatelessWidget {
  static const idScreen = "dashboard";
  final VisitPlanRepo _masterRepo = VisitPlanRepo();
  //final CustomerRepo _customerRepo = CustomerRepo();
  List<ListVisitPlanModel> list = [];
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
              //list = await _masterRepo.fetchListVp(
              //"2021-04-06 00:00:00", "2021-04-06 23:59:00");
              print(timeFormat(1));
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
