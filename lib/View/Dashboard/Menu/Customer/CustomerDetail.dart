import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'package:salesappmobile/View/Dashboard/Menu/Customer/ListCustomer.dart';

class CustomerDetail extends StatelessWidget {
  String name, decision, address, provinsi, kecamatan, kelurahan, kota, kodepos;

  CustomerDetail(
      {this.name,
      this.decision,
      this.address,
      this.provinsi,
      this.kecamatan,
      this.kelurahan,
      this.kota,
      this.kodepos});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorRedFigma,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                width: size.width,
                color: colorRedFigma,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                height: 200,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.black,
                      child: Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage("Images/bulma.png"),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            // height: 150,
            // color: Colors.lime,
            child: Text(
              "Decison Maker: " + decision,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Flexible(
            child: Container(
                child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Address',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    address,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Tipe',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "Tunai ",
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Provinsi',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    provinsi,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Kecamatan',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    kecamatan,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Kelurahan',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    kelurahan,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Kota',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    kota,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    height: 30,
                    width: size.width,
                    child: Title(
                      color: Colors.black,
                      child: Text(
                        'Kode Pos',
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    kodepos,
                    maxLines: 3,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
