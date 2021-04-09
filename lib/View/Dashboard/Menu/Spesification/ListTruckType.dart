import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/ListTruckType/bloc/listtrucktypebloc_bloc.dart';
import 'package:salesappmobile/Model/spesification/ListTruckTypeModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Spesification/TruckDetail.dart';

class ListTruckType extends StatefulWidget {
  final String id;

  const ListTruckType({Key key, this.id}) : super(key: key);

  @override
  _ListTruckTypeState createState() => _ListTruckTypeState(id);
}

class _ListTruckTypeState extends State<ListTruckType> {
  List<ListTruckTypeModel> _listTruckTypeModel = [];
  String id;
  _ListTruckTypeState(this.id);
  @override
  void initState() {
    super.initState();
    // print(id);
    BlocProvider.of<ListtrucktypeblocBloc>(context)
        .add(ListtrucktypeblocEventStarted(id: id));
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
          "Izuzu D Max",
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
                          return ListTruckType();
                        }));
                      }))
            ],
          ),
          BlocBuilder<ListtrucktypeblocBloc, ListtrucktypeblocState>(
              builder: (context, state) {
            print(state);
              if (state is ListtrucktypeblocLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ListtrucktypeblocLoaded) {
                _listTruckTypeModel = state.listspesificationModel;
                return Container(
                  height: size.height - 210,
                  child: ListView.builder(
                    itemCount: _listTruckTypeModel.length,
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
                                   _listTruckTypeModel[index].name,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TruckDetail();
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
            }
          )
        ],
      ),
    );
  }
}
