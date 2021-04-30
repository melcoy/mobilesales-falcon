import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanAdd/bloc/visitplanaddbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanPending/bloc/visitplanpendingbloc_bloc.dart';
import 'package:salesappmobile/Util/Util.dart';

class VPPending extends StatefulWidget {
  @override
  _VPPendingState createState() => _VPPendingState();
}

class _VPPendingState extends State<VPPending> {
  bool value = false;
  bool tunaiValue = false;
  bool kreditValue = false;
  String val;
  String selectedReason;
  String selectedStatusVP;
  TextEditingController additionalController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VisitplanpendingblocBloc>(context)
        .add(VisitplanpendingblocEventStarted());
  }

  @override
  Widget build(BuildContext context) {
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
          title: Container(
            child: Text(
              "Sales",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: BlocListener<VisitplanpendingblocBloc, VisitplanpendingblocState>(
          listener: (context, state) {
            if (state is VisitplanpendingblocFaillure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 4),
                  content: Text(state.errMsg)));
            }
          },
          child:
              BlocBuilder<VisitplanpendingblocBloc, VisitplanpendingblocState>(
                  builder: (context, state) {
            if (state is VisitplanaddblocLoading) {
              return Center(
                child: Container(child: CircularProgressIndicator()),
              );
            } else if (state is VisitplanpendingblocLoaded) {
              return ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Status Visit Plan Type",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonFormField<String>(
                                hint: Text('Status Visit Plan'),
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 36,
                                isExpanded: true,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                value: selectedStatusVP,
                                onChanged: (String newValue) {
                                  setState(() {
                                    selectedStatusVP = newValue;
                                    print(selectedStatusVP);
                                  });
                                },
                                items: state.listStatusPending.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem['id'].toString(),
                                          child:
                                              Text("- " + valueItem['name']));
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Status Reason Type",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonFormField<String>(
                                hint: Text('Reason Type'),
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 36,
                                isExpanded: true,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                value: selectedReason,
                                onChanged: (String newValue) {
                                  setState(() {
                                    selectedReason = newValue;
                                  });
                                },
                                items: state.listReason.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem['id'].toString(),
                                          child: Text(valueItem['name']));
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Additional Reason",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 100,
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextFormField(
                              controller: additionalController,
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Additional Reason';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(fontSize: 14.0),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  )),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: colorRedFigma,
                              onPrimary: Colors.white,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                            child: Container(
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "Save Reason",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                BlocProvider.of<VisitplanpendingblocBloc>(
                                        context)
                                    .add(
                                  VisitplanpendingblocEventSavePressed(
                                      idPendingReason: selectedReason,
                                      idStatusVP: selectedStatusVP,
                                      pendingNote: additionalController.text),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Container(),
              );
            }
          }),
        ));
  }
}
