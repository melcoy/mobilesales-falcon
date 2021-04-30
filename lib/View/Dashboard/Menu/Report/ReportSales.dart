import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Report/ReportSales/bloc/reportsalesbloc_bloc.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class ReportSales extends StatefulWidget {
  @override
  _ReportSalesState createState() => _ReportSalesState();
}

List<ReportSalesModel> _reportSaleModel = [];
  double x = double.parse(_reportSaleModel.first.kunjunganAktual) *100 /double.parse(_reportSaleModel.first.targetKunjungan);
  String value = x.toStringAsFixed(2).toString();

class _ReportSalesState extends State<ReportSales> {
  DateTime pickedDate;
  String day;
  String month;
  String year;
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    print('pickedDate');
    print(pickedDate.day + 30);
    BlocProvider.of<ReportsalesblocBloc>(context)
        .add(ReportsalesblocEventStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorRedFigma,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderReport(),
            BlocBuilder<ReportsalesblocBloc, ReportsalesblocState>(
                builder: (context, state) {
              // double x = 90.8;
              if (state is ReportsalesblocLoading) {
                return Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is ReportsalesblocLoaded) {
                _reportSaleModel = state.reportsalesModel;
                return Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 40,
                                child: Text(
                                  "Goal",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                )),
                            Container(
                              height: 40,
                              child: Text(
                                "Visit this Month",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: Text(
                                "Target Value",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            width: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  child: Text(
                                    "Target",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    _reportSaleModel[0].targetKunjungan,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    '0',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            width: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  child: Text(
                                    "Actual",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    _reportSaleModel[0].kunjunganAktual,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    "1000",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  child: Text(
                                    "% ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    value + '%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: Text(
                                    "1000%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

class HeaderReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<ReportsalesblocBloc, ReportsalesblocState>(
            builder: (context, state) {
          if (state is ReportsalesblocLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ReportsalesblocLoaded) {
            _reportSaleModel = state.reportsalesModel;
            return Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: colorRedFigma,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Sale",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp.100.000.000",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 120,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: colorRedFigma.withOpacity(0.23),
                            )
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Target: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rp. ' +
                                        _reportSaleModel[0]
                                            .targetPencapaianLocale,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.red,
                              width: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "This Month: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Rp. ' +
                                            _reportSaleModel[0].salesLocale,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ],
    );
  }
}
