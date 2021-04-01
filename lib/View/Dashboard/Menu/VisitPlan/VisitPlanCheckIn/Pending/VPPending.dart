import 'package:flutter/material.dart';
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
  String truckChoose;

  List truck = [
    "Izuzu D Max",
    "Izuzu Panther",
    "Izuzu MuX",
  ];
  final _formKey = GlobalKey<FormState>();
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
      body: ListView(
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
                          "Reason Type",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        hint: Text('Reason Type'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: truckChoose,
                        onChanged: (newValue) {
                          setState(() {
                            truckChoose = newValue;
                          });
                        },
                        items: truck.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
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
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
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
                  RaisedButton(
                    color: colorRedFigma,
                    textColor: Colors.white,
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
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(14.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Data')));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return Dashboard();
                        // }));
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
}
