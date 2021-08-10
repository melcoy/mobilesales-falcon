import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:salesappmobile/ApiServices/Master/master_provider.dart';
import 'package:salesappmobile/Bloc/Customer/CustomerAdd/bloc/customeraddbloc_bloc.dart';

import 'package:salesappmobile/Model/Customer/Dto/CustomerAddDto.dart';
import 'package:salesappmobile/Model/Master/KotaModel.dart';
import 'package:salesappmobile/Model/Master/ProvinsiModel.dart';

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
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController provController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  String selectKota = "";
  String selectProv = "";

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CustomeraddblocBloc>(context)
    //     .add(CustomeraddblocEventStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
            }

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
                                "Phone Number",
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
                            controller: phoneController,
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
                                "Email",
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
                            controller: emailController,
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
                                "Gender",
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
                              hint: Text(
                                'Gender',
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
                          child: TypeAheadField<ProvinsiModel>(
                            hideSuggestionsOnKeyboardHide: false,
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: provController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: 'Search Province',
                              ),
                            ),
                            suggestionsCallback:
                                MasterProvider.getSuggestionProv,
                            itemBuilder: (context, suggestion) {
                              final prov = suggestion;

                              return ListTile(
                                title: Text(prov.name),
                              );
                            },
                            noItemsFoundBuilder: (context) => Container(
                              height: 100,
                              child: Center(
                                child: Text(
                                  'No Users Found.',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            onSuggestionSelected: (suggestion) {
                              final prov = suggestion;
                              selectProv = prov.id;
                              provController.text = prov.name;
                            },
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
                          child: TypeAheadField<KotaModel>(
                            hideSuggestionsOnKeyboardHide: false,
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: cityController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: 'Search City',
                              ),
                            ),
                            suggestionsCallback:
                                MasterProvider.getSuggestionCity,
                            itemBuilder: (context, suggestion) {
                              final city = suggestion;

                              return ListTile(
                                title: Text(city.name),
                              );
                            },
                            noItemsFoundBuilder: (context) => Container(
                              height: 100,
                              child: Center(
                                child: Text(
                                  'No City Found.',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            onSuggestionSelected: (suggestion) {
                              final city = suggestion;
                              selectKota = city.id;
                              cityController.text = city.name;
                            },
                          ),
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
                                if (selectProv != "" && selectProv != "") {
                                  BlocProvider.of<CustomeraddblocBloc>(context)
                                      .add(
                                    CustomeraddblocEventSave(CustomerAddDto(
                                        kota: selectKota,
                                        provinsi: selectProv,
                                        alamat: addressController.text,
                                        hp: phoneController.text,
                                        email: emailController.text,
                                        name: prospectController.text,
                                        sex: selectedSalution)),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: const Duration(seconds: 4),
                                          content: Text(
                                              "Please Complete the Field")));
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
        ),
      ),
    );
  }
}
