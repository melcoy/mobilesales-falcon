import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salesappmobile/Bloc/Customer/ListCustomer/bloc/listcustomerbloc_bloc.dart';
import 'package:salesappmobile/Util/Util.dart';

class VisitPlanAddDialog extends StatefulWidget {
  @override
  _DialogCheckInState createState() => _DialogCheckInState();
}

class _DialogCheckInState extends State<VisitPlanAddDialog> {
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListcustomerblocBloc>(context)
        .add(ListcustomerblocEventStarted());
  }
  //File imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose Customer",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Search: ",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      height: 40,
                      width: size.width * 0.45,
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
                    Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: colorRedFigma,
                              size: 30,
                            ),
                            onPressed: () {
                              BlocProvider.of<ListcustomerblocBloc>(context)
                                  .add(ListcustomerblocEventSearch(
                                      searchText: editingController.text));
                            })),
                    Container(
                        child: TextButton(
                            child: Text(
                              "All",
                              style:
                                  TextStyle(color: colorRedFigma, fontSize: 15),
                            ),
                            onPressed: () {
                              BlocProvider.of<ListcustomerblocBloc>(context)
                                  .add(ListcustomerblocEventStarted());
                            })),
                  ],
                ),
                BlocBuilder<ListcustomerblocBloc, ListcustomerblocState>(
                    builder: (context, state) {
                  if (state is ListcustomerblocLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ListcustomerblocLoaded) {
                    return Container(
                      height: size.height * 0.4,
                      child: ListView.builder(
                        itemCount: state.listCustomerModel.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 150,
                            width: double.maxFinite,
                            child: Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Container(
                                    height: 30,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      state.listCustomerModel[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  leading: Container(
                                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                      child: Icon(
                                        Icons.circle,
                                        color: colorRedFigma,
                                      )),
                                  subtitle: Text(
                                    state.listCustomerModel[index].alamat,
                                    maxLines: 3,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
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
                                    var arr = [
                                      state.listCustomerModel[index].id,
                                      state.listCustomerModel[index].name,
                                      state.listCustomerModel[index].dm,
                                    ];
                                    Navigator.pop(context, arr);
                                  },
                                )),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        child: Text("No Data"),
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: colorRedFigma, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
