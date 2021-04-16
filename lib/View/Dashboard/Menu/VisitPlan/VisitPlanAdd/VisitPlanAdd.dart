import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salesappmobile/Bloc/Customer/CustomerAdd/bloc/customeraddbloc_bloc.dart';
import 'package:salesappmobile/Bloc/Customer/ListCustomer/bloc/listcustomerbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanAdd/bloc/visitplanaddbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanAdd/VisitPlanAddDialog.dart';

class VisitPlanAdd extends StatefulWidget {
  @override
  _VisitPlanAddState createState() => _VisitPlanAddState();
}

class _VisitPlanAddState extends State<VisitPlanAdd> {
  final _formKey = GlobalKey<FormState>();
  DateTime pickedDate;
  TimeOfDay time;
  DateFormat dateFormat = DateFormat('HH:mm');
  String customerId = "Choose Customer";
  String customerName = "Choose Customer";
  String dmName = "Choose Customer";
  TextEditingController addressController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

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
            "Add Visit Plan",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocListener<VisitplanaddblocBloc, VisitplanaddblocState>(
            listener: (context, state) {
          if (state is VisitplanaddblocSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 4),
                content: Text(state.succMsg.toString())));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Dashboard();
            }));
          }
          if (state is VisitplanaddblocFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 4),
                content: Text(state.errMsg)));
          }
        }, child: BlocBuilder<VisitplanaddblocBloc, VisitplanaddblocState>(
          builder: (context, state) {
            return ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Choose Date',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text(
                              "Date : ${pickedDate.year}-${pickedDate.month}-${pickedDate.day}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickDate,

                          // onTap: _pickTime,
                        ),
                        ListTile(
                          title: Text("Time : ${time.hour}:${time.minute}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickTime,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                          height: 30,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "Prospect ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              )),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              height: 50,
                              child: Text(
                                customerName,
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: colorRedFigma,
                                  size: 35,
                                ),
                                onPressed: () async {
                                  var idCustomerPage = await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          BlocProvider<ListcustomerblocBloc>(
                                              create: (BuildContext context) =>
                                                  ListcustomerblocBloc(),
                                              child: VisitPlanAddDialog()));
                                  if (idCustomerPage != null) {
                                    setState(() {
                                      customerId = idCustomerPage[0].toString();
                                      customerName =
                                          idCustomerPage[1].toString();
                                      dmName = idCustomerPage[2].toString();
                                    });
                                  }
                                })
                          ],
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                "Decision Maker ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 50,
                          child: Text(
                            dmName,
                          ),
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                "Meeting Point",
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
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(6)),
                          child: TextFormField(
                            controller: addressController,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Address';
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
                        //
                        SizedBox(
                          height: 20.0,
                        ),

                        if (state is VisitplanaddblocLoading)
                          Center(
                            child: CircularProgressIndicator(),
                          )
                        else
                          ElevatedButton(
                            child: Container(
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "Add Plan",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
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
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if (customerName == "Choose Customer") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Please input some data')));
                                } else {
                                  String schedule =
                                      "${datePick(pickedDate)} ${time.hour}:${time.minute}:00";
                                  BlocProvider.of<VisitplanaddblocBloc>(context)
                                      .add(VisitplanaddblocEventSave(
                                          model: VisitPlanAddModel(
                                              customer: customerId,
                                              tanggal: schedule,
                                              venue: addressController.text)));
                                }
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (t != null)
      setState(() {
        time = t;
      });
  }
}
