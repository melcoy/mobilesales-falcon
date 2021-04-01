import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';

class VPSalesInput extends StatefulWidget {
  @override
  _VPSalesInputState createState() => _VPSalesInputState();
}

class _VPSalesInputState extends State<VPSalesInput> {
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
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          "Sales Number ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 50,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Sales Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "SL-1212-2121",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: tunaiValue,
                        onChanged: (value) {
                          tunaiValue = !tunaiValue;
                          setState(() {});
                        },
                      ),
                      Text('Tunai'),
                      Container(
                        padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                        child: Checkbox(
                          value: kreditValue,
                          onChanged: (value) {
                            kreditValue = !kreditValue;
                            setState(() {});
                          },
                        ),
                      ),
                      Text('Kredit')
                    ],
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Truck Type",
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
                        hint: Text('Truck Type'),
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
                          "Qty",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Qty';
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
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Discount",
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
                          return 'Enter Discount';
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
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Bonus",
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
                          return 'Enter Bonus';
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
                          "Save Sales",
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
