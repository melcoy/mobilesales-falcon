import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Sales/SalesInput/bloc/salesinputbloc_bloc.dart';
import 'package:salesappmobile/Model/spesification/Dto/ListAllTruckDTO.dart';
import 'package:salesappmobile/Util/SizeConfig.dart';
import 'package:salesappmobile/Util/Util.dart';

class VPSalesInputTruckDialog extends StatefulWidget {
  @override
  _DialogCheckInState createState() => _DialogCheckInState();
}

class _DialogCheckInState extends State<VPSalesInputTruckDialog> {
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SalesinputblocBloc>(context)
        .add(SaleSalesinputblocEventStarted());
  }
  //File imageFile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: SizeConfig.blockVertical * 5,
              bottom: SizeConfig.blockVertical * 2,
              left: SizeConfig.blockHorizontal * 2,
              right: SizeConfig.blockHorizontal * 2),
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
            children: [
              Text(
                "Choose Product",
                style: TextStyle(
                  fontSize: SizeConfig.blockVertical * 3,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Search: ",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockVertical * 3),
                    ),
                  )),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.blockVertical * 2,
                        SizeConfig.blockHorizontal * 2,
                        SizeConfig.blockVertical * 0,
                        SizeConfig.blockHorizontal * 2),
                    height: SizeConfig.blockVertical * 6,
                    width: SizeConfig.blockHorizontal * 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: TextField(
                        controller: editingController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: colorRedFigma,
                              size: SizeConfig.blockVertical * 4,
                            ),
                            onPressed: () {
                              BlocProvider.of<SalesinputblocBloc>(context).add(
                                  SaleSalesinputblocEventSearch(
                                      searchProduct: editingController.text));
                            })),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        child: TextButton(
                            child: Text(
                              "All",
                              style: TextStyle(
                                  color: colorRedFigma,
                                  fontSize: SizeConfig.blockVertical * 2),
                            ),
                            onPressed: () {
                              BlocProvider.of<SalesinputblocBloc>(context)
                                  .add(SaleSalesinputblocEventStarted());
                            })),
                  ),
                ],
              ),
              BlocBuilder<SalesinputblocBloc, SalesinputblocState>(
                  builder: (context, state) {
                if (state is SalesinputblocLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SalesinputblocLoaded) {
                  return Container(
                    color: colorRedFigma,
                    height: SizeConfig.blockVertical * 60,
                    child: ListView.builder(
                      itemCount: state.listAllProduct.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 80,
                          width: double.maxFinite,
                          child: Card(
                              elevation: 5,
                              child: ListTile(
                                title: Container(
                                  height: 30,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    state.listAllProduct[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                trailing: Container(
                                  height: 30,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: colorRedFigma,
                                  ),
                                ),
                                onTap: () {
                                  List<String> nameBonus = [];
                                  for (int i = 0;
                                      i <
                                          state.listAllProduct[index].bonus
                                              .length;
                                      i++) {
                                    nameBonus.add(state
                                        .listAllProduct[index].bonus[i].name);
                                  }
                                  ListAllTruckDto model = ListAllTruckDto(
                                      bonus: nameBonus,
                                      discount:
                                          state.listAllProduct[index].discount,
                                      id: state.listAllProduct[index].id,
                                      type: state.listAllProduct[index].name,
                                      harga: state.listAllProduct[index].harga);

                                  Navigator.pop(context, model);
                                },
                              )),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
// Future<List<String>> arrayBonus(List<Bonus> bonus) async {
//   List<String> nameBonus;
//   for (int i = 0; i < bonus.length; i++) {
//     if (bonus[i].name == null) {
//       nameBonus.add("Tidak Ada Bonus");

//     } else {
//       //nameBonus.add(bonus[i].name);
//     }
//   }
//   return nameBonus;
// }
