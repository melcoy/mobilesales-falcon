import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salesappmobile/Bloc/Sales/ListSales/bloc/listsalesbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanPending/bloc/visitplanpendingbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/Pending/VPPending.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPListSalesInput.dart';

class VisitPlanCheckIn extends StatelessWidget {
  final CheckInDto model;
  VisitPlanCheckIn({this.model});
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
                      model.nama,
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
                    model.address,
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorRedFigma,
                onPrimary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              child: Text(
                "Add",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider<ListsalesblocBloc>(
                            create: (BuildContext context) =>
                                ListsalesblocBloc(),
                            child: VPListSalesInput(
                              model: model,
                            ))));
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorRedFigma,
                onPrimary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              child: Text(
                "Pending",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider<VisitplanpendingblocBloc>(
                              create: (BuildContext context) =>
                                  VisitplanpendingblocBloc(),
                              child: VPPending(
                                model: model,
                              ),
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
