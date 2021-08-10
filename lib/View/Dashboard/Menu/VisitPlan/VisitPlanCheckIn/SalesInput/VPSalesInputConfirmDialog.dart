import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salesappmobile/Bloc/Sales/SalesInput/bloc/salesinputbloc_bloc.dart';
import 'package:salesappmobile/Model/Sales/Dto/SalesInputSavedDto.dart';
import 'package:salesappmobile/Util/Util.dart';

final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
class VPSalesInputConfirmDialog extends StatelessWidget {
  double total = 0;
  String qty = "";
  String bonusAdded = "";
  String product = "";
  String discount = "";
  String bonus = "";
  String tipeBayar = "";
  String visitPlanId = "";
  String id = "";
  String textBayar = "";

  VPSalesInputConfirmDialog(
      {@required this.bonus,
      @required this.bonusAdded,
      @required this.product,
      @required this.discount,
      @required this.total,
      @required this.qty,
      @required this.tipeBayar,
      @required this.visitPlanId,
      @required this.id,
      @required this.textBayar});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Confirm Sales",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: colorRedFigma, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 75,
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        product,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 20,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Discount : " + discount + "%",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 20,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Bonus : " + bonus,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 20,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Qty : " + qty,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 20,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Payment Type : " + textBayar,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: 75,
                child: Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Bonus Added : " + bonusAdded,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      // "Total Price : ${formatCurrency.format(double.tryParse((total * double.parse(qty)).toStringAsFixed(0)))}"
                      "Total : ${formatCurrency.format(double.parse((total * double.parse(qty)).toStringAsFixed(0)))}"
                      // "Total Price : ${(total * double.parse(qty)).toStringAsFixed(0)}" 
                          ,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              BlocListener<SalesinputblocBloc, SalesinputblocState>(
                listener: (context, state) {
                  if (state is SalesinputblocSaved) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 4),
                        content: Text(state.savedMsg.toString())));
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                  if (state is SalesinputblocFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 4),
                        content: Text(state.errMsg)));
                  }
                },
                child: BlocBuilder<SalesinputblocBloc, SalesinputblocState>(
                  builder: (context, state) {
                    if (state is SalesinputblocLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: colorRedFigma,
                        onPrimary: Colors.white,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Confirm Sales",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        SalesInputSavedDto model = SalesInputSavedDto(
                            bonustambahan: bonusAdded,
                            discount: discount,
                            hargaterjual:
                                (total * double.parse(qty)).toStringAsFixed(0),
                            idProduk: id,
                            quantity: qty,
                            tipebayar: tipeBayar,
                            visitplan: visitPlanId);
                        BlocProvider.of<SalesinputblocBloc>(context).add(
                          SaleSalesinputblocEventSaved(model: model),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
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
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
