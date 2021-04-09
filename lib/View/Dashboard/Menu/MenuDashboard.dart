import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';

class MenuDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyMenu(
              title: "Visit Plan",
              icon: Icons.assignment,
              destination: '/VisitPlan',
            ),
            MyMenu(
              title: "Customer",
              icon: Icons.supervised_user_circle,
              destination: '/ListCustomer',
            ),
            MyMenu(
              title: "Spec & Price",
              icon: Icons.local_shipping,
              destination: '/ListTruck',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyMenu(
              title: "Report Sales",
              icon: Icons.assignment_ind,
              destination: '/ReportSales',
            ),
            MyMenu(title: "Promo & Disc", icon: Icons.contact_support_rounded),
            MyMenu(title: "About", icon: Icons.miscellaneous_services_rounded),
          ],
        ),
      ],
    ));
  }
}

class MyMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final destination;

  MyMenu({this.title, this.icon, this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            width: 100,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: colorRedFigmapastel,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, destination);
                },
                child: Center(
                  child: Container(
                    height: 95,
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: colorRedFigma, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
