import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesappmobile/Bloc/Spesification/ListProductDetail/bloc/listproductdetailbloc_bloc.dart';
import 'package:salesappmobile/Model/spesification/Dto/ListTruckDetailDTO.dart';
import 'package:salesappmobile/Model/spesification/ListTruckDetailModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class TruckDetail extends StatefulWidget {
  final String id;

  const TruckDetail({Key key, this.id}) : super(key: key);
  @override
  _TruckDetailState createState() => _TruckDetailState(id);
}

class _TruckDetailState extends State<TruckDetail> {
  List<ListTruckDetailDTO> _listTruckDetailModel = [];
  String id;
  _TruckDetailState(this.id);
  @override
  void initState() {
    super.initState();
    print('----------------------------- id');
    print(id);
    BlocProvider.of<ListproductdetailblocBloc>(context)
        .add(ListproductdetailblocEventStarted(id: id));
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
        ),
        body:
            BlocBuilder<ListproductdetailblocBloc, ListproductdetailblocState>(
                builder: (context, state) {
          String pembayaran;
          if (state is ListproductdetailblocLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListproductdetailblocLoaded) {
            _listTruckDetailModel = state.listdetailModel;
            return Container(
              child: ListView.builder(
                  itemCount: _listTruckDetailModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          child: Text(
                            _listTruckDetailModel[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: size.width,
                          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                          // color: colorRedFigma,
                          child: Image(
                            image: AssetImage("Images/izuzu.jpg"),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Harga : Rp. ' +
                                    _listTruckDetailModel[index].harga,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Engine',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "20000CC",
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Transmision',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Automatic/ Manual",
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Power',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "1000HP",
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Torque',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "400NM",
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            height: 30,
                            width: size.width,
                            child: Title(
                              color: Colors.black,
                              child: Text(
                                'Pembayaran',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            _listTruckDetailModel[index].pembayaran,
                            maxLines: 3,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
