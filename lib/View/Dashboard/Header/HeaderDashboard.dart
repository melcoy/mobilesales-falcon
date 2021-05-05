import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Dashboard/bloc/dashboardbloc_bloc.dart';
import 'package:salesappmobile/Util/Util.dart';

class HeaderDashboard extends StatefulWidget {
  @override
  _HeaderDashboardState createState() => _HeaderDashboardState();
}

class _HeaderDashboardState extends State<HeaderDashboard> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardblocBloc>(context).add(
      DashboardblocEventStarted(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardblocBloc, DashboardblocState>(
      listener: (context, state) {
        if (state is DashboardblocFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 4),
              content: Text(state.errMsg)));
        }
      },
      child: BlocBuilder<DashboardblocBloc, DashboardblocState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Container(
                height: 195,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 110,
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
                                "Total Sales",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              if (state is DashboardblocSuccess)
                                Text(
                                  state.model.salesLocale,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                )
                              else
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
                        bottom: 0,
                        left: 0,
                        right: 0,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (state is DashboardblocSuccess)
                                      Text(
                                        state.model.targetPencapaianLocale,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      )
                                    else
                                      Text(
                                        "Rp.100.000.000",
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
                                          "Target Visit: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      if (state is DashboardblocSuccess)
                                        Text(
                                          state.model.targetKunjungan,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      else
                                        Center(
                                          child: Text(
                                            "Rp.100.000.000",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
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
              )
            ],
          );
        },
      ),
    );
  }
}
