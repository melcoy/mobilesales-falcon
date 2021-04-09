import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Menu/Customer/ListCustomer/bloc/listcustomerbloc_bloc.dart';
import 'package:salesappmobile/Model/Dashboard/Menu/Customer/ListCustomerModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Customer/CustomerDetail.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Customer/CustomerForm.dart';

class ListCustomer extends StatefulWidget {
  @override
  _ListCustomerState createState() => _ListCustomerState();
}

class _ListCustomerState extends State<ListCustomer> {
  List<ListCustomerModel> _listCustomerModel = [];

  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListcustomerblocBloc>(context)
        .add(ListcustomerblocEventStarted());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        title: Text(
          "Customer List ",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.note_add,
                color: colorRedFigma,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerForm();
                }));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                width: size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: TextField(
                    maxLines: 1,
                    controller: editingController,
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
                        BlocProvider.of<ListcustomerblocBloc>(context).add(
                            ListcustomerblocEventSearch(
                                searchText: editingController.text));
                      })),
              Container(
                  child: TextButton(
                      child: Text(
                        "Back",
                        style: TextStyle(color: colorRedFigma, fontSize: 15),
                      ),
                      onPressed: () {
                        BlocProvider.of<ListcustomerblocBloc>(context)
                            .add(ListcustomerblocEventStarted());
                      })),
            ],
          ),
          BlocBuilder<ListcustomerblocBloc, ListcustomerblocState>(
            builder: (context, state) {
              print(state);
              if (state is ListcustomerblocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ListcustomerblocLoaded) {
                _listCustomerModel = state.listCustomerModel;

                return Container(
                  height: size.height - 250,
                  child: ListView.builder(
                    itemCount: _listCustomerModel.length,
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
                                  _listCustomerModel[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
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
                                _listCustomerModel[index].alamat,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CustomerDetail();
                                }));
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
            },
          )
        ],
      ),
    );
  }
}
