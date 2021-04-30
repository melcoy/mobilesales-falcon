import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/ListProductDetail/bloc/listproductdetailbloc_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/ListSubType/bloc/listsubtypebloc_bloc.dart';
import 'package:salesappmobile/Model/spesification/ListSubTypeModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Spesification/TruckDetail.dart';

class ListSubType extends StatefulWidget {
  final String id;

  const ListSubType({Key key, this.id}) : super(key: key);

  @override
  _ListSubTypeState createState() => _ListSubTypeState(id);
}

class _ListSubTypeState extends State<ListSubType> {
  List<ListSubTypeModel> _listSubTypeModel = [];
  String id;
  _ListSubTypeState(this.id);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsubtypeblocBloc>(context)
        .add(ListsubtypeblocEventStarted(id: id));
    // .add(ListtrucktypeblocEventStarted(id: id));
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
                          return ListSubType();
                        }));
                      }))
            ],
          ),
          BlocBuilder<ListsubtypeblocBloc, ListsubtypeblocState>(
              builder: (context, state) {
            if (state is ListsubtypeblocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListsubtypeblocLoaded) {
              _listSubTypeModel = state.listssubModel;
              return Container(
                height: size.height - 210,
                child: ListView.builder(
                  itemCount: _listSubTypeModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 100,
                      width: double.maxFinite,
                      child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Container(
                              height: 100,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                _listSubTypeModel[index].name,
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
                                          BlocProvider<ListproductdetailblocBloc>(
                                            create: (BuildContext context) =>
                                                ListproductdetailblocBloc(),
                                            child: TruckDetail(
                                              id: _listSubTypeModel[index].id,
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
