import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/Pending/VPPending.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPListSalesInput.dart';

class VisitPlanCheckIn extends StatelessWidget {
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: colorRedFigma,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Check-In",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.local_shipping,
              color: colorRedFigma,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.contact_support_rounded,
              color: colorRedFigma,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: Card(
                elevation: 5,
                child: ListTile(
                  title: Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Budi",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  leading: Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Icon(
                        Icons.circle,
                        color: colorRedFigma,
                      )),
                  subtitle: Text(
                    " Jln Soekarno Hatta 999 RT001 RW007 Kec BojongLoa Kaler kelurahan Bojong",
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: RaisedButton(
              elevation: 0.0,
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: Text(
                "Add",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: colorRedFigma,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VPListSalesInput();
                }));
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: RaisedButton(
              elevation: 0.0,
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: Text(
                "Pending",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: colorRedFigma,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VPPending();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
