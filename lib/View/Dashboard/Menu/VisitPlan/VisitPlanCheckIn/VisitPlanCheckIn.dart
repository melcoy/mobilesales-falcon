import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salesappmobile/Bloc/Sales/ListSales/bloc/listsalesbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanPending/bloc/visitplanpendingbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/visit_plan_checkout/bloc/visit_plan_checkout_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/SizeConfig.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/Pending/VPPending.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPListSalesInput.dart';

class VisitPlanCheckIn extends StatelessWidget {
  final CheckInDto model;
  VisitPlanCheckIn({this.model});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          TextButton(
              child: Text(
                "Check-Out",
                style: TextStyle(
                    color: colorRedFigma,
                    fontSize: SizeConfig.blockVertical * 2),
              ),
              onPressed: () {
                print("Alfan" + model.idVisitPlan);
                showDialog(
                    context: context,
                    builder: (context) => BlocProvider(
                          create: (context) => VisitPlanCheckoutBloc(),
                          child: DialogCheckOut(model),
                        ));
              }),
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

class DialogCheckOut extends StatefulWidget {
  final CheckInDto model;
  DialogCheckOut(this.model);
  @override
  _DialogCheckOutState createState() => _DialogCheckOutState(model);
}

class _DialogCheckOutState extends State<DialogCheckOut> {
  //File imageFile;
  final CheckInDto model;
  _DialogCheckOutState(this.model);
  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitPlanCheckoutBloc, VisitPlanCheckoutState>(
      listener: (context, state) {
        if (state is VisitPlanCheckoutFaillure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 4),
              content: Text(state.errMsg)));
        }
        if (state is VisitPlanCheckoutSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return VisitPlanCheckIn(
              model: model,
            );
          }));
        }
      },
      child: BlocBuilder<VisitPlanCheckoutBloc, VisitPlanCheckoutState>(
        builder: (context, state) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 16, left: 16, right: 16),
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0))
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Check In",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "Setelah melakukan Check-out, status tidak dapat kembali seperti semula. Apakah anda yakin?",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      if (state is VisitPlanCheckoutLoading)
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      else
                        ElevatedButton(
                          child: Text(
                            "Check Out",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: colorRedFigma,
                            onPrimary: Colors.white,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 50),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: () async {
                            BlocProvider.of<VisitPlanCheckoutBloc>(context)
                                .add(VisitPlanCheckoutPressed(model));
                          },
                        ),
                      TextButton(
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: colorRedFigma,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
