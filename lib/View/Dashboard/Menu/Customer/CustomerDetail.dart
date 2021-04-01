import 'package:flutter/material.dart';
import 'package:salesappmobile/Util/Util.dart';

class CustomerDetail extends StatelessWidget {
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
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: size.width,
                        color: colorRedFigma,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.black,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      AssetImage("Images/bulma.png"),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                'Victoria NoSecret',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
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
                      'Decision Maker : xxxxxx',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
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
                          'Address',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    subtitle: Text(
                          "xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx ",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                          "xxxxxxxxxxxxxxxxxxxxx ",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                          "xxxxxxxxxxxxxxxxxxxxx",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                          "xxxxxxxxxxxxxxxxxxxxx",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                          "xxxxxxxxxxxxxxxxxxxxx ",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
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
                          "xxxxxxxxxxxxxxxxxxxxx ",
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
