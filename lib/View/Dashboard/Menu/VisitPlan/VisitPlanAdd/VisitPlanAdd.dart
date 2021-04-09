import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanAdd/VisitPLanAddCustomer.dart';

class VisitPlanAdd extends StatefulWidget {
  @override
  _VisitPlanAddState createState() => _VisitPlanAddState();
}

class _VisitPlanAddState extends State<VisitPlanAdd> {
  final _formKey = GlobalKey<FormState>();
  DateTime pickedDate;
  TimeOfDay time;
  DateFormat dateFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    String valueChoose;
    List customer = ["1", "2"];
    Size size = MediaQuery.of(context).size;
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
      body: ListView(
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
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                        height: 50,
                        child: Text(
                          'Please Choose Customer',
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            color: colorRedFigma,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisitPlanAddCustomer();
                            }));
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
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 50,
                    child: Text(
                      'Mr. Udin Saepudin',
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          "Meeting Point",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
                  RaisedButton(
                    color: colorRedFigma,
                    textColor: Colors.white,
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
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(14.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Data')));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Dashboard();
                        }));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
