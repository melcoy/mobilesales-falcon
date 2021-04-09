import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Menu/Customer/CustomerAdd/bloc/customeraddbloc_bloc.dart';
import 'package:salesappmobile/Model/Customer/Dto/CustomerAddDto.dart';

import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Dashboard.dart';

import '../../../../Util/Util.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  bool value = false;
  bool tunaiValue = false;
  bool kreditValue = false;
  String selectedSalution;
  List salution = ["Men", "Women"];

  final _formKey = GlobalKey<FormState>();
  TextEditingController prospectController = new TextEditingController();
  TextEditingController decisionController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  String selectKota;
  String selectProv;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomeraddblocBloc>(context)
        .add(CustomeraddblocEventStart());
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
            "New Customer",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocListener<CustomeraddblocBloc, CustomeraddblocState>(
        listener: (context, state) {
          if (state is CustomeraddblocSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 4),
                content: Text(state.msg.toString())));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Dashboard();
            }));
          }
          if (state is CustomeraddblocFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 4),
                content: Text(state.errorMsg)));
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<CustomeraddblocBloc, CustomeraddblocState>(
          builder: (context, state) {
            if (state is CustomeraddblocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CustomeraddblocMasterLoaded) {
              String selectedProvince;
              String selectedCity;
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
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
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
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextFormField(
                              controller: prospectController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Name';
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
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
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
                            height: 50,
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextFormField(
                              controller: decisionController,
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
                          Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Tipe",
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
                                    print(value);
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
                                  "Salution",
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
                              child: DropdownButtonFormField<dynamic>(
                                value: selectedProvince,
                                hint: Text(
                                  'Salutation',
                                ),
                                onChanged: (salution) => setState(() {
                                  selectedSalution = salution;
                                }),
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                items: salution.map((valueItem) {
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
                                  "Provinsi",
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
                                value: selectedProvince,
                                hint: Text(
                                  'Province',
                                ),
                                onChanged: (String province) {
                                  setState(() {
                                    selectProv = province;
                                  });
                                },
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                items: state.provinsiModel?.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem['id'].toString(),
                                          child: Text(valueItem['name']));
                                    })?.toList() ??
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
                                  "Kota",
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
                                child: DropdownButtonFormField<dynamic>(
                                  value: selectedCity,
                                  hint: Text(
                                    'Kota',
                                  ),
                                  onChanged: (city) => setState(() {
                                    selectKota = city;
                                  }),
                                  validator: (value) =>
                                      value == null ? 'field required' : null,
                                  items: state.kotaModel?.map((valueItem) {
                                        return DropdownMenuItem(
                                            value: valueItem['id'].toString(),
                                            child: Text(valueItem['name']));
                                      })?.toList() ??
                                      [],
                                )),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          if (state is CustomeraddblocLoading)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          else
                            ElevatedButton(
                              child: Text(
                                'Save Customer',
                                style: TextStyle(
                                  fontSize: 18.0,
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
                                  BlocProvider.of<CustomeraddblocBloc>(context)
                                      .add(
                                    CustomeraddblocEventSave(CustomerAddDto(
                                        kota: selectKota,
                                        provinsi: selectProv,
                                        alamat: addressController.text,
                                        name: prospectController.text,
                                        sex: selectedSalution)),
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
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
