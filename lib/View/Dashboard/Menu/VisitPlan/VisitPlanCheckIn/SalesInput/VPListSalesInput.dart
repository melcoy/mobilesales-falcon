import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Sales/ListSales/bloc/listsalesbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/SizeConfig.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPSalesInput.dart';

class VPListSalesInput extends StatefulWidget {
  final CheckInDto model;
  const VPListSalesInput({Key key, this.model}) : super(key: key);
  @override
  _VisitPlanMenuState createState() => _VisitPlanMenuState(model);
}

class _VisitPlanMenuState extends State<VPListSalesInput> {
  CheckInDto model;
  _VisitPlanMenuState(this.model);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsalesblocBloc>(context).add(
      ListsalesblocEventStarted(idCustomer: model.idCustomer),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            "List of Sales",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.note_add,
                  color: colorRedFigma,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VPSalesInput(
                      model: model,
                    );
                  }));
                })
          ],
        ),
        body: BlocBuilder<ListsalesblocBloc, ListsalesblocState>(
          builder: (context, state) {
            if (state is ListsalesblocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListsalesblocLoaded) {
              return Container(
                child: ListView.builder(
                  itemCount: state.model.length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 150,
                      width: double.maxFinite,
                      child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: SizedBox(
                              height: 75,
                              child: Container(
                                height: 30,
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  state.model[index].produk,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Closing: " + state.model[index].raihan,
                                  maxLines: 3,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty: " + state.model[index].quantity,
                                  maxLines: 3,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: Container(
                              height: 30,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: colorRedFigma,
                              ),
                            ),
                            onTap: () {
                              // (imageFile!= null)? showDialog(
                              //     context: context,
                              //     builder: (context) => DialogCheckIn()) : SizedBox();
                            },
                          )),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Container(
                  child: Text("No Data"),
                ),
              );
            }
          },
        ));
  }
}
