import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';

import '../../../../Util/Util.dart';
import '../../../../Util/Util.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  bool value = false;
  bool tunaiValue = false;
  bool kreditValue = false;
  String val;
  String provinsiChoose;
  String kotaChoose;
  String kecamatanChoose;
  String kelurahanChoose;
  String kodeposChoose;
  List provinsi = ["provinsi 1", "provinsi 2", "provinsi 3", "provinsi 4", "provinsi 5", "provinsi 6", "provinsi 7", "provinsi 8", "provinsi 9", "provinsi 10", "provinsi 11", "provinsi 12", "provinsi 13", "provinsi 14"];
  List kota = ["kota 1", "kota 2", "kota 3", "kota 4"];
  List kecamatan = ["kecamatan 1", "kecamatan 2", "kecamatan 3", "kecamatan 4"];
  List kelurahan = ["kelurahan 1", "kelurahan 2", "kelurahan 3", "kelurahan 4"];
  List kodepos = ["kodepos 1", "kodepos 2", "kodepos 3", "kodepos 4"];

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
          margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
          child: Text(
            "New Customer",
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
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Prospect ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Name alfan teja gunawan teha akfan",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Decision Maker ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Name",
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
                          "Address",
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
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Tipe",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
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
                          "Provinsi",
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
                        hint: Text('Provinsi'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: provinsiChoose,
                        onChanged: (newValue) {
                          setState(() {
                            provinsiChoose = newValue;
                          });
                        },
                        items: provinsi.map((valueItem) {
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
                          "Kota",
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
                        hint: Text('Kota'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: kotaChoose,
                        onChanged: (newValue) {
                          setState(() {
                            kotaChoose = newValue;
                          });
                        },
                        items: kota.map((valueItem) {
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
                          "Kecamatan",
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
                        hint: Text('Kecamatan'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: kecamatanChoose,
                        onChanged: (newValue) {
                          setState(() {
                            kecamatanChoose = newValue;
                          });
                        },
                        items: kecamatan.map((valueItem) {
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
                          "Kelurahan",
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
                        hint: Text('Kelurahan'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: kelurahanChoose,
                        onChanged: (newValue) {
                          setState(() {
                            kelurahanChoose = newValue;
                          });
                        },
                        items: kelurahan.map((valueItem) {
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
                          "Kode Pos",
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
                        hint: Text('Kode Pos'),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: kodeposChoose,
                        onChanged: (newValue) {
                          setState(() {
                            kodeposChoose = newValue;
                          });
                        },
                        items: kodepos.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),
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
                          "Save Customer",
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
                        Navigator.pushReplacement(context,
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
}
