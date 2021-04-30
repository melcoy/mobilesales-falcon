import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/ListTruckType/bloc/listtrucktypebloc_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/bloc/listspesificationbloc_bloc.dart';
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Spesification/ListTruckType.dart';

class ListTruck extends StatefulWidget {
  @override
  _ListTruckState createState() => _ListTruckState();
}

class _ListTruckState extends State<ListTruck> {
  List<ListTruckModel> _listTruckModel = [];

  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListspesificationblocBloc>(context)
        .add(ListspesificationblocEventStarted());
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
          "Product List",
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                height: 40,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "search",
                        labelStyle: TextStyle(fontSize: 15.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colorRedFigma,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ListTruck();
                        }));
                      }))
            ],
          ),
          BlocBuilder<ListspesificationblocBloc, ListspesificationblocState>(
              builder: (context, state) {
            if (state is ListspesificationblocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListspesificationblocLoaded) {
              _listTruckModel = state.listspesificationModel;
              return Container(
                height: size.height - 250,
                child: ListView.builder(
                  itemCount: _listTruckModel.length,
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
                                _listTruckModel[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<ListtrucktypeblocBloc>(
                                            create: (BuildContext context) =>
                                                ListtrucktypeblocBloc(),
                                            child: ListTruckType(
                                              id: _listTruckModel[index].id,
                                            ),
                                          )));
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
          })
        ],
      ),
    );
  }
}
