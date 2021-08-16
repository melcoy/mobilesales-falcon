import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/ListVisitPlan/bloc/listvisitplanbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanAdd/bloc/visitplanaddbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanCheckIn/bloc/visitplancheckinbloc_bloc.dart';

import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/CameraPageState.dart';
import 'package:salesappmobile/Util/SizeConfig.dart';

import 'package:salesappmobile/Util/Util.dart';

import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanAdd/VisitPlanAdd.dart';

import 'VisitPlanCheckIn/VisitPlanCheckIn.dart';

class VisitPlanMenu extends StatefulWidget {
  @override
  _VisitPlanMenuState createState() => _VisitPlanMenuState();
}

class _VisitPlanMenuState extends State<VisitPlanMenu> {
  DateTime _pickedDateStart;
  DateTime _pickedDateEnd;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _pickedDateStart = DateTime.now();
    _pickedDateEnd = DateTime.now();

    BlocProvider.of<ListvisitplanblocBloc>(context)
        .add(ListvisitplanblocEventStarted());
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
          "Visit Plan",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider<VisitplanaddblocBloc>(
                                create: (BuildContext context) =>
                                    VisitplanaddblocBloc(),
                                child: VisitPlanAdd())));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              // Container(
              //   margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   height: 40,
              //   width: size.width * 0.65,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     child: TextField(
              //       controller: searchController,
              //       maxLines: 1,
              //       decoration: InputDecoration(
              //           border: InputBorder.none,
              //           labelText: "search",
              //           labelStyle: TextStyle(fontSize: 15.0),
              //           hintStyle: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 15.0,
              //           )),
              //       style: TextStyle(fontSize: 14.0),
              //     ),
              //   ),
              // ),
              // Container(
              //     child: IconButton(
              //         icon: Icon(
              //           Icons.search,
              //           color: colorRedFigma,
              //           size: 40,
              //         ),
              //         onPressed: () {
              //           BlocProvider.of<ListvisitplanblocBloc>(context).add(
              //               ListvisitplanblocEventSearch(
              //                   searchText: searchController.text));
              //         })),
              // Container(
              //     child: TextButton(
              //         child: Text(
              //           "All",
              //           style: TextStyle(color: colorRedFigma, fontSize: 15),
              //         ),
              //         onPressed: () {
              //           // BlocProvider.of<ListcustomerblocBloc>(context)
              //           //     .add(ListcustomerblocEventStarted());
              //         })),
            ],
          ),
          ListTile(
            title: Text(
                "Date Start : ${_pickedDateStart.year}-${_pickedDateStart.month}-${_pickedDateStart.day}",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockVertical * 2)),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: _pickDateStart,
            // onTap: _pickTime,
          ),
          ListTile(
            title: Text(
                "Date End : ${_pickedDateEnd.year}-${_pickedDateEnd.month}-${_pickedDateEnd.day}",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockVertical * 2)),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: _pickDateEnd,
            // onTap: _pickTime,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  child: Text(
                    "Submit Date & Time",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: colorRedFigma,
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    //var berlinWallFellDate = new DateTime.utc(1989, 11, 9);
                    if (_pickedDateEnd.compareTo(_pickedDateStart) < 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 4),
                          content: Text("Date Invalid")));
                    } else {
                      BlocProvider.of<ListvisitplanblocBloc>(context).add(
                          ListvisitplanblocEventDateSearch(
                              dateStart:
                                  "${_pickedDateStart.year}-${_pickedDateStart.month}-${_pickedDateStart.day} 00:00:00",
                              dateEnd:
                                  "${_pickedDateEnd.year}-${_pickedDateEnd.month}-${_pickedDateEnd.day} 23:59:59"));
                    }
                  })),
          Divider(
            color: Colors.black,
          ),
          BlocBuilder<ListvisitplanblocBloc, ListvisitplanblocState>(
              builder: (context, state) {
            if (state is ListvisitplanblocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListvisitplanLoaded) {
              return Flexible(
                fit: FlexFit.tight,
                child: ListView.builder(
                  itemCount: state.listVisitPlanModel.length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 150,
                      width: double.maxFinite,
                      child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Container(
                              height: 30,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                state.listVisitPlanModel[index].customer,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Text(
                              "Status Visit Plan: " +
                                  "${state.listVisitPlanModel[index].checkin.contains("10") ? "Undone| " : "Done | "}" +
                                  "Adress: " +
                                  state.listVisitPlanModel[index].venue +
                                  " | " +
                                  " Tanggal: " +
                                  state.listVisitPlanModel[index].tanggal
                                      .toString(),
                              maxLines: 3,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold),
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
                              CheckInDto model = CheckInDto(
                                  idVisitPlan:
                                      state.listVisitPlanModel[index].id,
                                  address:
                                      state.listVisitPlanModel[index].venue,
                                  idCustomer: state
                                      .listVisitPlanModel[index].customerid,
                                  nama:
                                      state.listVisitPlanModel[index].customer);
                              // (imageFile!= null)? showDialog(
                              //     context: context,
                              //     builder: (context) => DialogCheckIn()) : SizedBox();
                              if (state.listVisitPlanModel[index].checkin
                                  .contains("10")) {
                                showDialog(
                                    context: context,
                                    builder: (context) => DialogCheckIn(
                                          model: model,
                                        ));
                                setState(() {
                                  BlocProvider.of<ListvisitplanblocBloc>(
                                          context)
                                      .add(ListvisitplanblocEventStarted());
                                });
                              } else {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return VisitPlanCheckIn(
                                    model: model,
                                  );
                                }));
                              }
                            },
                          )),
                    );
                  },
                ),
              );
            } else if (state is ListvisitplanblocDataNull) {
              return Center(
                child: Container(
                  child: Text(state.errorMessage.toString()),
                ),
              );
            } else {
              return Center(
                child: Container(
                  child: Text("No Data"),
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  _pickDateStart() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: _pickedDateStart,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null)
      setState(() {
        _pickedDateStart = date;
      });
  }

  _pickDateEnd() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: _pickedDateEnd,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null)
      setState(() {
        _pickedDateEnd = date;
      });
  }
}

class DialogCheckIn extends StatefulWidget {
  final CheckInDto model;
  const DialogCheckIn({Key key, this.model}) : super(key: key);
  @override
  _DialogCheckInState createState() => _DialogCheckInState(model);
}

class _DialogCheckInState extends State<DialogCheckIn> {
  //File imageFile;

  CheckInDto model;

  _DialogCheckInState(this.model);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 16, left: 16, right: 16),
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
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Sebelum melakukan Check - In pastikan anda telah bertemu dengan Prospek",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  child: Text(
                    "Check In",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: colorRedFigma,
                    onPrimary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () async {
                    // imageFile = await Navigator.push<File>(context,
                    //     MaterialPageRoute(builder: (_) => Camera2PageState()));
                    // setState(() {});
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<VisitplancheckinblocBloc>(
                                    create: (BuildContext context) =>
                                        VisitplancheckinblocBloc(),
                                    child: CameraPageState(
                                      model: model,
                                    ))));
                  },
                ),
                TextButton(
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: colorRedFigma, fontWeight: FontWeight.bold),
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
  }
}
