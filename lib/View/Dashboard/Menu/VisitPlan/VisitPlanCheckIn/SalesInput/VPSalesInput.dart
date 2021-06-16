import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Sales/SalesInput/bloc/salesinputbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Model/spesification/Dto/ListAllTruckDTO.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPSalesInputConfirmDialog.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/SalesInput/VPSalesInputTruckDialog.dart';

class VPSalesInput extends StatefulWidget {
  final CheckInDto model;
  const VPSalesInput({Key key, this.model}) : super(key: key);

  @override
  _VPSalesInputState createState() => _VPSalesInputState(model);
}

class _VPSalesInputState extends State<VPSalesInput> {
  CheckInDto model;
  _VPSalesInputState(this.model);

  TextEditingController qtyController = new TextEditingController();
  TextEditingController bonusAddController = new TextEditingController();
  bool value = false;
  bool tunaiValue = false;
  bool kreditValue = false;
  bool plusAdd = false;
  double total = 0;
  String percent = "100.0";
  String val;
  String truckChoose;
  String chooseProduct = "Choose Product";
  String discount = "";
  String bonus = "";
  String idProduct = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget iconButton = IconButton(
        icon: Icon(
          Icons.add,
          color: colorRedFigma,
          size: 30,
        ),
        onPressed: () async {
          ListAllTruckDto model = await showDialog(
              context: context,
              builder: (context) => BlocProvider<SalesinputblocBloc>(
                  create: (BuildContext context) => SalesinputblocBloc(),
                  child: VPSalesInputTruckDialog()));
          if (model != null) {
            setState(() {
              idProduct = model.id;
              chooseProduct = model.type;
              discount = (double.parse(model.discount) * 100).toString();
              total = double.parse(model.harga) -
                  double.parse(model.harga) * double.parse(model.discount);

              for (int i = 0; i < model.bonus.length; i++) {
                bonus += model.bonus[i] + " ";
              }
              plusAdd = true;
            });
          }
        });
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Container(
                  //   height: 30,
                  //   child: Padding(
                  //       padding: const EdgeInsets.only(left: 0),
                  //       child: Text(
                  //         "Sales Number ",
                  //         style: Theme.of(context).textTheme.headline6.copyWith(
                  //             color: Colors.black, fontWeight: FontWeight.bold),
                  //       )),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //   height: 50,
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'No Sales Number';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         labelText: "SL-1212-2121",
                  //         labelStyle: TextStyle(fontSize: 14.0),
                  //         hintStyle: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 10.0,
                  //         )),
                  //   ),
                  // ),

                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                          height: 50,
                          child: Text(
                            chooseProduct,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          )),
                      plusAdd == false ? iconButton : Container()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Discount : " + discount + "%",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  // Container(
                  //   height: 100,
                  //   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(),
                  //       borderRadius: BorderRadius.circular(6)),
                  //   child: TextFormField(
                  //     maxLines: 5,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Enter Discount';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         labelStyle: TextStyle(fontSize: 14.0),
                  //         hintStyle: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 10.0,
                  //         )),
                  //     style: TextStyle(fontSize: 14.0),
                  //   ),
                  // ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Bonus : " + bonus,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),

                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Price : " + total.toStringAsFixed(0),
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: tunaiValue,
                        onChanged: (value) {
                          tunaiValue = !tunaiValue;
                          if (tunaiValue == true) {
                            kreditValue = false;
                          }
                          setState(() {});
                        },
                      ),
                      Text(
                        'Tunai',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                        child: Checkbox(
                          value: kreditValue,
                          onChanged: (value) {
                            kreditValue = !kreditValue;
                            if (kreditValue == true) {
                              tunaiValue = false;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Text(
                        'Kredit',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Qty",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
                      controller: qtyController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onEditingComplete: () {},
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
                          "Bonus Added",
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
                      controller: bonusAddController,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colorRedFigma,
                      onPrimary: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (!chooseProduct.contains("Choose Product")) {
                          String tipeBayar = "";
                          String textBayar = "";

                          if (kreditValue == false && tunaiValue == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 4),
                                content: Text("Please Input Type Payment")));
                          } else {
                            if (kreditValue == true) {
                              tipeBayar = "20";
                              textBayar = "kredit";
                            } else if (tunaiValue == true) {
                              tipeBayar = "10";
                              textBayar = "Cash";
                            }
                            print(tipeBayar);
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    BlocProvider<SalesinputblocBloc>(
                                      create: (context) => SalesinputblocBloc(),
                                      child: VPSalesInputConfirmDialog(
                                        bonus: bonus,
                                        bonusAdded: bonusAddController.text,
                                        discount: discount,
                                        product: chooseProduct,
                                        qty: qtyController.text,
                                        total: total,
                                        tipeBayar: tipeBayar,
                                        visitPlanId: model.idVisitPlan,
                                        id: idProduct,
                                        textBayar: textBayar,
                                      ),
                                    ));
                          }
                        }
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
